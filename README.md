# Reels

A Flutter package for displaying short videos like Instagram Reels, TikTok, or YouTube Shorts. This package provides a customizable `ReelsView` widget that can be easily integrated into any Flutter project.

## Features

-   **Highly Customizable:** Customize the UI with a wide range of options.
-   **Callbacks:** Get callbacks for user interactions like like, comment, share, and follow.
-   **Pre-loading:** Pre-load videos for a smooth user experience.
-   **Swipe to Dismiss:** Swipe up or down to dismiss the reels view.
-   **Custom Action Buttons:** Add your own custom action buttons.
-   **Show/Hide UI Elements:** Show or hide any UI element like title, description, likes, comments, etc.

## Getting started

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  reels: ^0.0.1 # Replace with the latest version
```

Then, import the package in your Dart file:

```dart
import 'package:reels/reels.dart';
```

## Usage

Here's a simple example of how to use the `ReelsView` widget:

```dart
import 'package:flutter/material.dart';
import 'package:reels/reels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reels Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ReelsExample(),
    );
  }
}

class ReelsExample extends StatefulWidget {
  const ReelsExample({super.key});

  @override
  State<ReelsExample> createState() => _ReelsExampleState();
}

class _ReelsExampleState extends State<ReelsExample> {
  final List<Video> reels = [
    Video(
      id: '1',
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_1a48335f-ea1e-47c7-819a-baa82e18042f.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 1',
      likes: 300,
      comments: 70,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_1a48335f-ea1e-47c7-819a-baa82e18042f.jpg',
      author: Author(
        id: '1',
        name: 'Video Author 1',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'An MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-06',
      location: 'Los Angeles, CA',
      views: 4000,
    ),
    // Add more videos here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReelsView(
        reels: reels,
        onLike: (reelId) {
          print('Liked reel with id: $reelId');
        },
        onComment: (reelId) {
          print('Commented on reel with id: $reelId');
        },
        onShare: (reelId) {
          print('Shared reel with id: $reelId');
        },
        onFollow: (authorId) {
          print('Followed author with id: $authorId');
        },
      ),
    );
  }
}
```

## Additional information

-   This package is still under development, and more features will be added soon.
-   Contributions are welcome! If you have any ideas or suggestions, please open an issue or a pull request on GitHub.
-   If you encounter any bugs, please file an issue on GitHub.
