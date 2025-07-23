import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reels/src/models/video_model.dart';
import 'package:video_player/video_player.dart';

class ReelsView extends StatefulWidget {
  final List<Video> reels;

  const ReelsView({
    Key? key,
    required this.reels,
  }) : super(key: key);

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
  final int _preloadCount = 3; // Pre-load 2 videos before and after

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

    // Dispose controllers outside the preload range
    for (int i = 0; i < _videoControllers.length; i++) {
      if (i < page - _preloadCount || i > page + _preloadCount) {
        if (_videoControllers[i] != null) {
          _videoControllers[i]!.dispose();
          _videoControllers[i] = null;
        }
      }
    }

    // Initialize controllers for the current and surrounding pages
    for (int i = page - _preloadCount; i <= page + _preloadCount; i++) {
      if (i >= 0 && i < widget.reels.length) {
        if (_videoControllers[i] == null) {
          _videoControllers[i] = _createVideoPlayerController(widget.reels[i]);
          _videoControllers[i]!.initialize().then((_) {
            _videoControllers[i]!.setLooping(true);
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
    if (_isLiked.value) {
      _likeAnimationController.forward().then((_) {
        _likeAnimationController.reverse();
      });
    }
  }

  void _showCommentSection() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const CommentSection(),
    );
  }

  void _showShareDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ShareDialog(),
    );
  }

  void _followAuthor() {
    // Implement follow logic
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragDistance += details.delta.dy;
      // Update animation value based on drag distance
      _dismissAnimationController.value =
          (_dragDistance / context.size!.height).abs().clamp(0.0, 1.0);
    });
  }

  void _onVerticalDragEnd(DragEndDetails details) {
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
              // Always build the VideoReel, and let it handle the loading state internally.
              // This ensures the thumbnail is shown while the video is loading.
              final controller = _videoControllers[index];
              if (controller == null) {
                // This can happen if the page is outside the preload range.
                // Return a placeholder that shows the thumbnail.
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.reels[index].thumbnailUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
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

  const VideoReel({
    Key? key,
    required this.reel,
    required this.controller,
    required this.onLike,
    required this.onComment,
    required this.onShare,
    required this.onFollow,
    required this.likeAnimation,
    required this.isLiked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onLike,
      onTap: () {
        if (controller.value.isPlaying) {
          controller.pause();
        } else {
          controller.play();
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          VideoPlayerWidget(
              controller: controller, thumbnailUrl: reel.thumbnailUrl),
          VideoOverlay(controller: controller),
          LikeAnimation(likeAnimation: likeAnimation),
          const VideoGradient(),
          VideoDetails(
            reel: reel,
            isLiked: isLiked,
            onComment: onComment,
            onShare: onShare,
            onFollow: onFollow,
          ),
          VideoProgressBar(controller: controller),
          VideoControls(
            controller: controller,
            onSettings: () => _showSettingsDialog(context),
            onMore: () => _showMoreOptionsDialog(context),
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

  const VideoPlayerWidget(
      {Key? key, required this.controller, required this.thumbnailUrl})
      : super(key: key);

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
          return const Center(
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
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        }
      },
    );
  }
}

class VideoOverlay extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoOverlay({Key? key, required this.controller}) : super(key: key);

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
              Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.replay,
                    size: 80,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.seekTo(Duration.zero);
                    controller.play();
                  },
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

  const LikeAnimation({Key? key, required this.likeAnimation})
      : super(key: key);

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
  const VideoGradient({Key? key}) : super(key: key);

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

  const VideoDetails({
    Key? key,
    required this.reel,
    required this.isLiked,
    required this.onComment,
    required this.onShare,
    required this.onFollow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthorInfo(author: reel.author, onFollow: onFollow),
          const SizedBox(height: 10),
          Text(
            reel.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            reel.description,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            children: reel.tags
                .map((tag) => Chip(
                      label: Text(tag),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ))
                .toList(),
          ),
          const SizedBox(height: 10),
          Text(
            'Uploaded on ${reel.uploadDate}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          EngagementStats(
            reel: reel,
            isLiked: isLiked,
            onComment: onComment,
            onShare: onShare,
          ),
        ],
      ),
    );
  }
}

class AuthorInfo extends StatelessWidget {
  final Author author;
  final VoidCallback onFollow;

  const AuthorInfo({Key? key, required this.author, required this.onFollow})
      : super(key: key);

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
        if (author.isVerified)
          const Icon(
            Icons.verified,
            color: Colors.blue,
            size: 16,
          ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: onFollow,
          child: const Text(
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

  const EngagementStats(
      {Key? key,
      required this.reel,
      required this.isLiked,
      required this.onComment,
      required this.onShare})
      : super(key: key);

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
        ValueListenableBuilder<bool>(
          valueListenable: isLiked,
          builder: (context, liked, child) {
            return Row(
              children: [
                Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  color: liked ? Colors.red : Colors.white,
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
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.comment, color: Colors.white),
              onPressed: onComment,
            ),
            const SizedBox(width: 10),
            Text(
              reel.comments.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.share, color: Colors.white),
          onPressed: onShare,
        ),
      ],
    );
  }
}

class VideoProgressBar extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoProgressBar({Key? key, required this.controller})
      : super(key: key);

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
                    activeColor: Colors.red,
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

  const VideoControls(
      {Key? key,
      required this.controller,
      required this.onSettings,
      required this.onMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 20,
      child: Row(
        children: [
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
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: onSettings,
          ),
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
  const SettingsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
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
  const ShareDialog({Key? key}) : super(key: key);

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
  const CommentSection({Key? key}) : super(key: key);

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
  const MoreOptionsDialog({Key? key}) : super(key: key);

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
