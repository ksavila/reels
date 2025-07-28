import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reels/src/models/video_model.dart';
import 'package:video_player/video_player.dart';

typedef LikeCallback = void Function(String reelId);
typedef CommentCallback = void Function(String reelId);
typedef ShareCallback = void Function(String reelId);
typedef FollowCallback = void Function(String authorId);
typedef IndexChangedCallback = void Function(int index);

class ReelsView extends StatefulWidget {
  final List<Video> reels;
  final LikeCallback? onLike;
  final CommentCallback? onComment;
  final ShareCallback? onShare;
  final FollowCallback? onFollow;
  final IndexChangedCallback? onIndexChanged;
  final Widget? likeIcon;
  final Widget? unlikeIcon;
  final Widget? commentIcon;
  final Widget? shareIcon;
  final Widget? followText;
  final Widget? verifiedBadge;
  final Color? progressBarColor;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final bool showProgress;
  final bool loop;
  final bool showVerifiedTick;
  final bool showAuthor;
  final bool showLikes;
  final bool showComments;
  final bool showShares;
  final bool showViews;
  final bool showTags;
  final bool showDescription;
  final bool showTitle;
  final bool showUploadDate;
  final bool showFollowButton;
  final bool showMoreOptions;
  final bool showSettings;
  final bool showVolumeControl;
  final bool showPlayPause;
  final bool showBuffering;
  final bool showReplay;
  final bool showGradient;
  final bool showLikeAnimation;
  final bool allowSwipeToDismiss;
  final bool allowDoubleTapToLike;
  final bool allowTapToPause;
  final int preloadCount;
  final List<Widget>? rightActionButtons;
  final List<Widget>? leftActionButtons;

  const ReelsView({
    super.key,
    required this.reels,
    this.onLike,
    this.onComment,
    this.onShare,
    this.onFollow,
    this.onIndexChanged,
    this.likeIcon,
    this.unlikeIcon,
    this.commentIcon,
    this.shareIcon,
    this.followText,
    this.verifiedBadge,
    this.progressBarColor,
    this.loadingWidget,
    this.errorWidget,
    this.showProgress = true,
    this.loop = true,
    this.showVerifiedTick = true,
    this.showAuthor = true,
    this.showLikes = true,
    this.showComments = true,
    this.showShares = true,
    this.showViews = true,
    this.showTags = true,
    this.showDescription = true,
    this.showTitle = true,
    this.showUploadDate = true,
    this.showFollowButton = true,
    this.showMoreOptions = true,
    this.showSettings = true,
    this.showVolumeControl = true,
    this.showPlayPause = true,
    this.showBuffering = true,
    this.showReplay = true,
    this.showGradient = true,
    this.showLikeAnimation = true,
    this.allowSwipeToDismiss = true,
    this.allowDoubleTapToLike = true,
    this.allowTapToPause = true,
    this.preloadCount = 3,
    this.rightActionButtons,
    this.leftActionButtons,
  });

  @override
  State<ReelsView> createState() => _ReelsViewState();
}

class _ReelsViewState extends State<ReelsView> with TickerProviderStateMixin {
  late PageController _pageController;
  late List<VideoPlayerController?> _videoControllers;
  late AnimationController _likeAnimationController;
  late Animation<double> _likeAnimation;
  final ValueNotifier<bool> _isLiked = ValueNotifier(false);
  int _currentPage = 0;

  // for swipe up and down to dismiss
  double _dragDistance = 0.0;
  late AnimationController _dismissAnimationController;
  late Animation<double> _dismissAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _backgroundAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _videoControllers =
        List<VideoPlayerController?>.filled(widget.reels.length, null);
    _likeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _likeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_likeAnimationController);

    _dismissAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _dismissAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_dismissAnimationController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.of(context).pop();
            }
          });
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8)
        .animate(_dismissAnimationController);
    _backgroundAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.black.withOpacity(0.5),
    ).animate(_dismissAnimationController);

    _initializeControllersForPage(_currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _videoControllers) {
      controller?.dispose();
    }
    _likeAnimationController.dispose();
    _dismissAnimationController.dispose();
    _isLiked.dispose();
    super.dispose();
  }

  void _initializeControllersForPage(int page) {
    // Pause the old video
    if (_videoControllers[_currentPage] != null &&
        _videoControllers[_currentPage]!.value.isInitialized) {
      _videoControllers[_currentPage]!.pause();
    }

    _currentPage = page;
    widget.onIndexChanged?.call(page);

    // Dispose controllers outside the preload range
    for (int i = 0; i < _videoControllers.length; i++) {
      if (i < page - widget.preloadCount || i > page + widget.preloadCount) {
        if (_videoControllers[i] != null) {
          _videoControllers[i]!.dispose();
          _videoControllers[i] = null;
        }
      }
    }

    // Initialize controllers for the current and surrounding pages
    for (int i = page - widget.preloadCount;
        i <= page + widget.preloadCount;
        i++) {
      if (i >= 0 && i < widget.reels.length) {
        if (_videoControllers[i] == null) {
          _videoControllers[i] = _createVideoPlayerController(widget.reels[i]);
          _videoControllers[i]!.initialize().then((_) {
            _videoControllers[i]!.setLooping(widget.loop);
            // Autoplay if it's the current page
            if (i == _currentPage) {
              _videoControllers[i]!.play();
            }
            if (mounted) {
              setState(() {});
            }
          });
        }
      }
    }

    // Ensure the current page plays if it was already initialized
    if (_videoControllers[page] != null &&
        _videoControllers[page]!.value.isInitialized) {
      _videoControllers[page]!.play();
    }
  }

  void _onPageChanged(int index) {
    _initializeControllersForPage(index);
  }

  VideoPlayerController _createVideoPlayerController(Video reel) {
    if (reel.videoType == VideoType.m3u8) {
      return VideoPlayerController.networkUrl(
        Uri.parse(reel.url),
        videoPlayerOptions: VideoPlayerOptions(
          mixWithOthers: true,
        ),
      );
    } else {
      return VideoPlayerController.networkUrl(Uri.parse(reel.url));
    }
  }

  void _toggleLike() {
    _isLiked.value = !_isLiked.value;
    widget.onLike?.call(widget.reels[_currentPage].id);
    if (_isLiked.value && widget.showLikeAnimation) {
      _likeAnimationController.forward().then((_) {
        _likeAnimationController.reverse();
      });
    }
  }

  void _showCommentSection() {
    widget.onComment?.call(widget.reels[_currentPage].id);
  }

  void _showShareDialog() {
    widget.onShare?.call(widget.reels[_currentPage].id);
  }

  void _followAuthor() {
    widget.onFollow?.call(widget.reels[_currentPage].author.id);
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (!widget.allowSwipeToDismiss) return;
    setState(() {
      _dragDistance += details.delta.dy;
      // Update animation value based on drag distance
      _dismissAnimationController.value =
          (_dragDistance / context.size!.height).abs().clamp(0.0, 1.0);
    });
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (!widget.allowSwipeToDismiss) return;
    final velocity = details.primaryVelocity ?? 0;
    if (velocity.abs() > 500 || _dragDistance.abs() > 100) {
      _dismissAnimationController.forward();
    } else {
      _dismissAnimationController.reverse().then((_) {
        setState(() {
          _dragDistance = 0;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _dismissAnimationController,
      builder: (context, child) {
        return Container(
          color: _backgroundAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Transform.translate(
              offset: Offset(0, _dragDistance),
              child: Opacity(
                opacity: _dismissAnimation.value,
                child: child,
              ),
            ),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onVerticalDragUpdate: _onVerticalDragUpdate,
          onVerticalDragEnd: _onVerticalDragEnd,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: widget.reels.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              final controller = _videoControllers[index];
              if (controller == null) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.reels[index].thumbnailUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          widget.loadingWidget ??
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          widget.errorWidget ?? const Icon(Icons.error),
                    ),
                    widget.loadingWidget ??
                        const Center(child: CircularProgressIndicator()),
                  ],
                );
              }
              return VideoReel(
                reel: widget.reels[index],
                controller: controller,
                likeAnimation: _likeAnimation,
                isLiked: _isLiked,
                onLike: _toggleLike,
                onComment: _showCommentSection,
                onShare: _showShareDialog,
                onFollow: _followAuthor,
                allowDoubleTapToLike: widget.allowDoubleTapToLike,
                allowTapToPause: widget.allowTapToPause,
                commentIcon: widget.commentIcon,
                errorWidget: widget.errorWidget,
                followText: widget.followText,
                leftActionButtons: widget.leftActionButtons,
                likeIcon: widget.likeIcon,
                loadingWidget: widget.loadingWidget,
                progressBarColor: widget.progressBarColor,
                rightActionButtons: widget.rightActionButtons,
                shareIcon: widget.shareIcon,
                showAuthor: widget.showAuthor,
                showBuffering: widget.showBuffering,
                showComments: widget.showComments,
                showDescription: widget.showDescription,
                showFollowButton: widget.showFollowButton,
                showGradient: widget.showGradient,
                showLikeAnimation: widget.showLikeAnimation,
                showLikes: widget.showLikes,
                showMoreOptions: widget.showMoreOptions,
                showPlayPause: widget.showPlayPause,
                showProgress: widget.showProgress,
                showReplay: widget.showReplay,
                showSettings: widget.showSettings,
                showShares: widget.showShares,
                showTags: widget.showTags,
                showTitle: widget.showTitle,
                showUploadDate: widget.showUploadDate,
                showVerifiedTick: widget.showVerifiedTick,
                showVolumeControl: widget.showVolumeControl,
                unlikeIcon: widget.unlikeIcon,
                verifiedBadge: widget.verifiedBadge,
              );
            },
          ),
        ),
      ),
    );
  }
}

class VideoReel extends StatelessWidget {
  final Video reel;
  final VideoPlayerController controller;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;
  final VoidCallback onFollow;
  final Animation<double> likeAnimation;
  final ValueNotifier<bool> isLiked;
  final bool allowDoubleTapToLike;
  final bool allowTapToPause;
  final Widget? likeIcon;
  final Widget? unlikeIcon;
  final Widget? commentIcon;
  final Widget? shareIcon;
  final Widget? followText;
  final Widget? verifiedBadge;
  final Color? progressBarColor;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final bool showProgress;
  final bool showVerifiedTick;
  final bool showAuthor;
  final bool showLikes;
  final bool showComments;
  final bool showShares;
  final bool showTags;
  final bool showDescription;
  final bool showTitle;
  final bool showUploadDate;
  final bool showFollowButton;
  final bool showMoreOptions;
  final bool showSettings;
  final bool showVolumeControl;
  final bool showPlayPause;
  final bool showBuffering;
  final bool showReplay;
  final bool showGradient;
  final bool showLikeAnimation;
  final List<Widget>? rightActionButtons;
  final List<Widget>? leftActionButtons;

  const VideoReel({
    super.key,
    required this.reel,
    required this.controller,
    required this.onLike,
    required this.onComment,
    required this.onShare,
    required this.onFollow,
    required this.likeAnimation,
    required this.isLiked,
    required this.allowDoubleTapToLike,
    required this.allowTapToPause,
    this.likeIcon,
    this.unlikeIcon,
    this.commentIcon,
    this.shareIcon,
    this.followText,
    this.verifiedBadge,
    this.progressBarColor,
    this.loadingWidget,
    this.errorWidget,
    required this.showProgress,
    required this.showVerifiedTick,
    required this.showAuthor,
    required this.showLikes,
    required this.showComments,
    required this.showShares,
    required this.showTags,
    required this.showDescription,
    required this.showTitle,
    required this.showUploadDate,
    required this.showFollowButton,
    required this.showMoreOptions,
    required this.showSettings,
    required this.showVolumeControl,
    required this.showPlayPause,
    required this.showBuffering,
    required this.showReplay,
    required this.showGradient,
    required this.showLikeAnimation,
    this.rightActionButtons,
    this.leftActionButtons,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: allowDoubleTapToLike ? onLike : null,
      onTap: () {
        if (allowTapToPause) {
          if (controller.value.isPlaying) {
            controller.pause();
          } else {
            controller.play();
          }
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          VideoPlayerWidget(
            controller: controller,
            thumbnailUrl: reel.thumbnailUrl,
            loadingWidget: loadingWidget,
            errorWidget: errorWidget,
          ),
          if (showPlayPause) VideoOverlay(controller: controller),
          if (showLikeAnimation) LikeAnimation(likeAnimation: likeAnimation),
          if (showGradient) const VideoGradient(),
          VideoDetails(
            reel: reel,
            isLiked: isLiked,
            onComment: onComment,
            onShare: onShare,
            onFollow: onFollow,
            likeIcon: likeIcon,
            unlikeIcon: unlikeIcon,
            commentIcon: commentIcon,
            shareIcon: shareIcon,
            followText: followText,
            verifiedBadge: verifiedBadge,
            showAuthor: showAuthor,
            showComments: showComments,
            showDescription: showDescription,
            showFollowButton: showFollowButton,
            showLikes: showLikes,
            showTags: showTags,
            showTitle: showTitle,
            showUploadDate: showUploadDate,
            showVerifiedTick: showVerifiedTick,
            showShares: showShares,
          ),
          if (showProgress)
            VideoProgressBar(
              controller: controller,
              color: progressBarColor,
            ),
          VideoControls(
            controller: controller,
            onSettings: () => _showSettingsDialog(context),
            onMore: () => _showMoreOptionsDialog(context),
            showMoreOptions: showMoreOptions,
            showSettings: showSettings,
            showVolumeControl: showVolumeControl,
          ),
          if (rightActionButtons != null)
            Positioned(
              right: 10,
              bottom: 100,
              child: Column(
                children: rightActionButtons!,
              ),
            ),
          if (leftActionButtons != null)
            Positioned(
              left: 10,
              bottom: 100,
              child: Column(
                children: leftActionButtons!,
              ),
            ),
        ],
      ),
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const SettingsDialog(),
    );
  }

  void _showMoreOptionsDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const MoreOptionsDialog(),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  final String thumbnailUrl;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  const VideoPlayerWidget({
    super.key,
    required this.controller,
    required this.thumbnailUrl,
    this.loadingWidget,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        if (value.isInitialized) {
          return AspectRatio(
            aspectRatio: value.aspectRatio,
            child: VideoPlayer(controller),
          );
        } else if (value.hasError) {
          return errorWidget ??
              const Center(
                child: Text(
                  'Error loading video',
                  style: TextStyle(color: Colors.white),
                ),
              );
        } else {
          return CachedNetworkImage(
            imageUrl: thumbnailUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                loadingWidget ??
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                errorWidget ?? const Icon(Icons.error),
          );
        }
      },
    );
  }
}

class VideoOverlay extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoOverlay({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        return Stack(
          children: [
            if (value.isBuffering)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (value.position == value.duration && !value.isPlaying)
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            if (!value.isPlaying && value.position != value.duration)
              const Center(
                child: Icon(
                  Icons.play_arrow,
                  size: 80,
                  color: Colors.white,
                ),
              ),
          ],
        );
      },
    );
  }
}

class LikeAnimation extends StatelessWidget {
  final Animation<double> likeAnimation;

  const LikeAnimation({super.key, required this.likeAnimation});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: likeAnimation,
      child: const Center(
        child: Icon(
          Icons.favorite,
          size: 80,
          color: Colors.red,
        ),
      ),
    );
  }
}

class VideoGradient extends StatelessWidget {
  const VideoGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.3),
            Colors.transparent,
            Colors.black.withOpacity(0.3),
          ],
        ),
      ),
    );
  }
}

class VideoDetails extends StatelessWidget {
  final Video reel;
  final ValueNotifier<bool> isLiked;
  final VoidCallback onComment;
  final VoidCallback onShare;
  final VoidCallback onFollow;
  final Widget? likeIcon;
  final Widget? unlikeIcon;
  final Widget? commentIcon;
  final Widget? shareIcon;
  final Widget? followText;
  final Widget? verifiedBadge;
  final bool showVerifiedTick;
  final bool showAuthor;
  final bool showLikes;
  final bool showComments;
  final bool showShares;
  final bool showTags;
  final bool showDescription;
  final bool showTitle;
  final bool showUploadDate;
  final bool showFollowButton;

  const VideoDetails({
    super.key,
    required this.reel,
    required this.isLiked,
    required this.onComment,
    required this.onShare,
    required this.onFollow,
    this.likeIcon,
    this.unlikeIcon,
    this.commentIcon,
    this.shareIcon,
    this.followText,
    this.verifiedBadge,
    required this.showVerifiedTick,
    required this.showAuthor,
    required this.showLikes,
    required this.showComments,
    required this.showShares,
    required this.showTags,
    required this.showDescription,
    required this.showTitle,
    required this.showUploadDate,
    required this.showFollowButton,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showAuthor)
            AuthorInfo(
              author: reel.author,
              onFollow: onFollow,
              followText: followText,
              verifiedBadge: verifiedBadge,
              showFollowButton: showFollowButton,
              showVerifiedTick: showVerifiedTick,
            ),
          if (showAuthor) const SizedBox(height: 10),
          if (showTitle)
            Text(
              reel.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (showTitle) const SizedBox(height: 10),
          if (showDescription)
            Text(
              reel.description,
              style: const TextStyle(color: Colors.white),
            ),
          if (showDescription) const SizedBox(height: 10),
          if (showTags)
            Wrap(
              spacing: 8.0,
              children: reel.tags
                  .map((tag) => Chip(
                        label: Text(
                          tag,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        backgroundColor: Colors.black.withOpacity(0.8),
                      ))
                  .toList(),
            ),
          if (showTags) const SizedBox(height: 10),
          if (showUploadDate)
            Text(
              'Uploaded on ${reel.uploadDate}',
              style: const TextStyle(color: Colors.white),
            ),
          if (showUploadDate) const SizedBox(height: 10),
          EngagementStats(
            reel: reel,
            isLiked: isLiked,
            onComment: onComment,
            onShare: onShare,
            likeIcon: likeIcon,
            unlikeIcon: unlikeIcon,
            commentIcon: commentIcon,
            shareIcon: shareIcon,
            showComments: showComments,
            showLikes: showLikes,
            showShares: showShares,
          ),
        ],
      ),
    );
  }
}

class AuthorInfo extends StatelessWidget {
  final Author author;
  final VoidCallback onFollow;
  final Widget? followText;
  final Widget? verifiedBadge;
  final bool showVerifiedTick;
  final bool showFollowButton;

  const AuthorInfo({
    super.key,
    required this.author,
    required this.onFollow,
    this.followText,
    this.verifiedBadge,
    required this.showVerifiedTick,
    required this.showFollowButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(author.avatarUrl),
        ),
        const SizedBox(width: 10),
        Text(
          author.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (author.isVerified && showVerifiedTick)
          verifiedBadge ??
              const Icon(
                Icons.verified,
                color: Colors.blue,
                size: 16,
              ),
        const SizedBox(width: 10),
        if (showFollowButton)
          TextButton(
            onPressed: onFollow,
            child: followText ??
                const Text(
                  'Follow',
                  style: TextStyle(color: Colors.white),
                ),
          ),
      ],
    );
  }
}

class EngagementStats extends StatelessWidget {
  final Video reel;
  final ValueNotifier<bool> isLiked;
  final VoidCallback onComment;
  final VoidCallback onShare;
  final Widget? likeIcon;
  final Widget? unlikeIcon;
  final Widget? commentIcon;
  final Widget? shareIcon;
  final bool showLikes;
  final bool showComments;
  final bool showShares;

  const EngagementStats({
    super.key,
    required this.reel,
    required this.isLiked,
    required this.onComment,
    required this.onShare,
    this.likeIcon,
    this.unlikeIcon,
    this.commentIcon,
    this.shareIcon,
    required this.showLikes,
    required this.showComments,
    required this.showShares,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.visibility, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              reel.views.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        if (showLikes)
          ValueListenableBuilder<bool>(
            valueListenable: isLiked,
            builder: (context, liked, child) {
              return Row(
                children: [
                  liked
                      ? likeIcon ??
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                      : unlikeIcon ??
                          const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                  const SizedBox(width: 10),
                  Text(
                    (liked ? reel.likes + 1 : reel.likes).toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              );
            },
          ),
        if (showComments)
          Row(
            children: [
              IconButton(
                icon: commentIcon ??
                    const Icon(Icons.comment, color: Colors.white),
                onPressed: onComment,
              ),
              const SizedBox(width: 10),
              Text(
                reel.comments.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        if (showShares)
          IconButton(
            icon: shareIcon ?? const Icon(Icons.share, color: Colors.white),
            onPressed: onShare,
          ),
      ],
    );
  }
}

class VideoProgressBar extends StatelessWidget {
  final VideoPlayerController controller;
  final Color? color;

  const VideoProgressBar({super.key, required this.controller, this.color});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          return Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  '${value.position.inMinutes.toString().padLeft(2, '0')}:${(value.position.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 16.0),
                    trackHeight: 2.0,
                  ),
                  child: Slider(
                    value: value.position.inSeconds.toDouble(),
                    min: 0.0,
                    max: value.duration.inSeconds.toDouble(),
                    onChanged: (value) {
                      controller.seekTo(Duration(seconds: value.toInt()));
                    },
                    activeColor: color ?? Colors.red,
                    inactiveColor: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Text(
                  '${value.duration.inMinutes.toString().padLeft(2, '0')}:${(value.duration.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class VideoControls extends StatelessWidget {
  final VideoPlayerController controller;
  final VoidCallback onSettings;
  final VoidCallback onMore;
  final bool showVolumeControl;
  final bool showSettings;
  final bool showMoreOptions;

  const VideoControls({
    super.key,
    required this.controller,
    required this.onSettings,
    required this.onMore,
    required this.showVolumeControl,
    required this.showSettings,
    required this.showMoreOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 20,
      child: Row(
        children: [
          if (showVolumeControl)
            ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, value, child) {
                return IconButton(
                  icon: Icon(
                    value.volume == 0 ? Icons.volume_off : Icons.volume_up,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.setVolume(value.volume == 0 ? 1.0 : 0.0);
                  },
                );
              },
            ),
          if (showSettings)
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: onSettings,
            ),
          if (showMoreOptions)
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: onMore,
            ),
        ],
      ),
    );
  }
}

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView(
        children: [
          const ListTile(
            title: Text('Video Quality'),
          ),
          ListTile(
            title: const Text('Auto'),
            onTap: () {
              // Set video quality to auto
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('480p'),
            onTap: () {
              // Set video quality to 480p
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('720p'),
            onTap: () {
              // Set video quality to 720p
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class ShareDialog extends StatelessWidget {
  const ShareDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          const ListTile(
            title: Text('Share'),
          ),
          ListTile(
            leading: const Icon(Icons.link),
            title: const Text('Copy Link'),
            onTap: () {
              // Copy link to clipboard
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Send as Message'),
            onTap: () {
              // Send as message
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class CommentSection extends StatelessWidget {
  const CommentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: [
          const ListTile(
            title: Text('Comments'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with actual comment count
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: CircleAvatar(
                    child: Text('U'),
                  ),
                  title: Text('User Name'),
                  subtitle: Text('This is a comment.'),
                );
              },
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Add a comment...',
            ),
          ),
        ],
      ),
    );
  }
}

class MoreOptionsDialog extends StatelessWidget {
  const MoreOptionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          const ListTile(
            title: Text('More Options'),
          ),
          ListTile(
            leading: const Icon(Icons.report),
            title: const Text('Report'),
            onTap: () {
              // Report video
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.save),
            title: const Text('Save'),
            onTap: () {
              // Save video
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
