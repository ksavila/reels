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
      url: 'http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8',
      videoType: VideoType.m3u8,
      title: 'M3U8 Video',
      likes: 100,
      comments: 50,
      thumbnailUrl:
          'https://images.pexels.com/photos/259915/pexels-photo-259915.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Flutter',
        avatarUrl:
            'https://storage.googleapis.com/cms-storage-bucket/stable-and-reliable.3461c6a5b33c339001c5.jpg',
        isVerified: true,
      ),
      description: 'A beautiful bee collecting nectar from a flower.',
      tags: ['bee', 'flower', 'nature'],
      uploadDate: '2022-01-01',
      location: 'San Francisco, CA',
      views: 1000,
    ),
    Video(
      url: 'https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8',
      title: 'Butterfly',
      videoType: VideoType.m3u8,
      likes: 200,
      comments: 100,
      thumbnailUrl:
          'https://images.pexels.com/photos/1123972/pexels-photo-1123972.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Flutter',
        avatarUrl:
            'https://storage.googleapis.com/cms-storage-bucket/stable-and-reliable.3461c6a5b33c339001c5.jpg',
        isVerified: true,
      ),
      description: 'A beautiful butterfly on a leaf.',
      tags: ['butterfly', 'leaf', 'nature'],
      uploadDate: '2022-01-02',
      location: 'New York, NY',
      views: 2000,
    ),
    Video(
      url:
          'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8',
      videoType: VideoType.m3u8,
      title: 'Apple BipBop Demo',
      likes: 150,
      comments: 40,
      thumbnailUrl:
          'https://images.pexels.com/photos/919734/pexels-photo-919734.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Apple Dev',
        avatarUrl:
            'https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg',
        isVerified: true,
      ),
      description:
          'Apple HLS advanced example with multiple audio/video tracks.',
      tags: ['demo', 'apple', 'bipbop'],
      uploadDate: '2022-01-03',
      location: 'Cupertino, CA',
      views: 1200,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_1a48335f-ea1e-47c7-819a-baa82e18042f.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 1',
      likes: 300,
      comments: 70,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
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
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_a903943a-d1bb-46c4-b02a-22b4477624d7.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 2',
      likes: 350,
      comments: 90,
      thumbnailUrl:
          'https://images.pexels.com/photos/23769/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 2',
        avatarUrl:
            'https://images.pexels.com/photos/1123972/pexels-photo-1123972.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: true,
      ),
      description: 'Another MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-07',
      location: 'Houston, TX',
      views: 5000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_7a633c51-42e3-45b1-9e63-6f8fe2b9966a.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 3',
      likes: 400,
      comments: 110,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 3',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'Yet another MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-08',
      location: 'New York, NY',
      views: 6000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/App_User__7253306_b21967b9-0727-4bc9-b77e-b6375c3b1e66.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 4',
      likes: 450,
      comments: 130,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 4',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A fourth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-09',
      location: 'San Francisco, CA',
      views: 7000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_dea3f288-7356-4467-9bfe-2b5177b183cb.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 5',
      likes: 500,
      comments: 150,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 5',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A fifth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-10',
      location: 'Los Angeles, CA',
      views: 8000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18953932_8afb9a5f-5a28-43d8-9c6d-6f1a039a90a0.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 6',
      likes: 550,
      comments: 170,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 6',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A sixth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-11',
      location: 'Houston, TX',
      views: 9000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2ae2a0e9-2a76-4bf2-a48a-81c9306a6ff6.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 7',
      likes: 600,
      comments: 190,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 7',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A seventh MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-12',
      location: 'Los Angeles, CA',
      views: 10000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_4e5fc1ae-ec35-40fb-8f53-c77d72cc5740.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 8',
      likes: 650,
      comments: 210,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 8',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'An eighth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-13',
      location: 'Houston, TX',
      views: 11000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_4bd0def8-4bb9-4b32-aee8-040100c7cc31.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 9',
      likes: 700,
      comments: 230,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 9',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A ninth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-14',
      location: 'New York, NY',
      views: 12000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_9bca46ca-cbea-46d3-a14a-d4e8f9753499.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 10',
      likes: 750,
      comments: 250,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 10',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A tenth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-15',
      location: 'San Francisco, CA',
      views: 13000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_9001776b-fab5-465e-89b2-e0a9fcfa60b8.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 11',
      likes: 800,
      comments: 270,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 11',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'An eleventh MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-16',
      location: 'Los Angeles, CA',
      views: 14000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_8064305f-aece-48b7-babb-9a093601238a.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 12',
      likes: 850,
      comments: 290,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 12',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A twelfth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-17',
      location: 'Houston, TX',
      views: 15000,
    ),
    Video(
      url: 'http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8',
      videoType: VideoType.m3u8,
      title: 'M3U8 Video',
      likes: 100,
      comments: 50,
      thumbnailUrl:
          'https://images.pexels.com/photos/259915/pexels-photo-259915.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Flutter',
        avatarUrl:
            'https://storage.googleapis.com/cms-storage-bucket/stable-and-reliable.3461c6a5b33c339001c5.jpg',
        isVerified: true,
      ),
      description: 'A beautiful bee collecting nectar from a flower.',
      tags: ['bee', 'flower', 'nature'],
      uploadDate: '2022-01-01',
      location: 'San Francisco, CA',
      views: 1000,
    ),
    Video(
      url: 'https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8',
      title: 'Butterfly',
      videoType: VideoType.m3u8,
      likes: 200,
      comments: 100,
      thumbnailUrl:
          'https://images.pexels.com/photos/1123972/pexels-photo-1123972.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Flutter',
        avatarUrl:
            'https://storage.googleapis.com/cms-storage-bucket/stable-and-reliable.3461c6a5b33c339001c5.jpg',
        isVerified: true,
      ),
      description: 'A beautiful butterfly on a leaf.',
      tags: ['butterfly', 'leaf', 'nature'],
      uploadDate: '2022-01-02',
      location: 'New York, NY',
      views: 2000,
    ),
    Video(
      url:
          'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8',
      videoType: VideoType.m3u8,
      title: 'Apple BipBop Demo',
      likes: 150,
      comments: 40,
      thumbnailUrl:
          'https://images.pexels.com/photos/919734/pexels-photo-919734.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Apple Dev',
        avatarUrl:
            'https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg',
        isVerified: true,
      ),
      description:
          'Apple HLS advanced example with multiple audio/video tracks.',
      tags: ['demo', 'apple', 'bipbop'],
      uploadDate: '2022-01-03',
      location: 'Cupertino, CA',
      views: 1200,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_1a48335f-ea1e-47c7-819a-baa82e18042f.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 1',
      likes: 300,
      comments: 70,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
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
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_a903943a-d1bb-46c4-b02a-22b4477624d7.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 2',
      likes: 350,
      comments: 90,
      thumbnailUrl:
          'https://images.pexels.com/photos/23769/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 2',
        avatarUrl:
            'https://images.pexels.com/photos/1123972/pexels-photo-1123972.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: true,
      ),
      description: 'Another MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-07',
      location: 'Houston, TX',
      views: 5000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_7a633c51-42e3-45b1-9e63-6f8fe2b9966a.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 3',
      likes: 400,
      comments: 110,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 3',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'Yet another MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-08',
      location: 'New York, NY',
      views: 6000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/App_User__7253306_b21967b9-0727-4bc9-b77e-b6375c3b1e66.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 4',
      likes: 450,
      comments: 130,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 4',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A fourth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-09',
      location: 'San Francisco, CA',
      views: 7000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_dea3f288-7356-4467-9bfe-2b5177b183cb.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 5',
      likes: 500,
      comments: 150,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 5',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A fifth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-10',
      location: 'Los Angeles, CA',
      views: 8000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18953932_8afb9a5f-5a28-43d8-9c6d-6f1a039a90a0.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 6',
      likes: 550,
      comments: 170,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 6',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A sixth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-11',
      location: 'Houston, TX',
      views: 9000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2ae2a0e9-2a76-4bf2-a48a-81c9306a6ff6.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 7',
      likes: 600,
      comments: 190,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 7',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A seventh MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-12',
      location: 'Los Angeles, CA',
      views: 10000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_4e5fc1ae-ec35-40fb-8f53-c77d72cc5740.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 8',
      likes: 650,
      comments: 210,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 8',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'An eighth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-13',
      location: 'Houston, TX',
      views: 11000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_4bd0def8-4bb9-4b32-aee8-040100c7cc31.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 9',
      likes: 700,
      comments: 230,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 9',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A ninth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-14',
      location: 'New York, NY',
      views: 12000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_9bca46ca-cbea-46d3-a14a-d4e8f9753499.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 10',
      likes: 750,
      comments: 250,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 10',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A tenth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-15',
      location: 'San Francisco, CA',
      views: 13000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_9001776b-fab5-465e-89b2-e0a9fcfa60b8.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 11',
      likes: 800,
      comments: 270,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 11',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'An eleventh MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-16',
      location: 'Los Angeles, CA',
      views: 14000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_8064305f-aece-48b7-babb-9a093601238a.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 12',
      likes: 850,
      comments: 290,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 12',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A twelfth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-17',
      location: 'Houston, TX',
      views: 15000,
    ),
    Video(
      url: 'http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8',
      videoType: VideoType.m3u8,
      title: 'M3U8 Video',
      likes: 100,
      comments: 50,
      thumbnailUrl:
          'https://images.pexels.com/photos/259915/pexels-photo-259915.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Flutter',
        avatarUrl:
            'https://storage.googleapis.com/cms-storage-bucket/stable-and-reliable.3461c6a5b33c339001c5.jpg',
        isVerified: true,
      ),
      description: 'A beautiful bee collecting nectar from a flower.',
      tags: ['bee', 'flower', 'nature'],
      uploadDate: '2022-01-01',
      location: 'San Francisco, CA',
      views: 1000,
    ),
    Video(
      url: 'https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8',
      title: 'Butterfly',
      videoType: VideoType.m3u8,
      likes: 200,
      comments: 100,
      thumbnailUrl:
          'https://images.pexels.com/photos/1123972/pexels-photo-1123972.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Flutter',
        avatarUrl:
            'https://storage.googleapis.com/cms-storage-bucket/stable-and-reliable.3461c6a5b33c339001c5.jpg',
        isVerified: true,
      ),
      description: 'A beautiful butterfly on a leaf.',
      tags: ['butterfly', 'leaf', 'nature'],
      uploadDate: '2022-01-02',
      location: 'New York, NY',
      views: 2000,
    ),
    Video(
      url:
          'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8',
      videoType: VideoType.m3u8,
      title: 'Apple BipBop Demo',
      likes: 150,
      comments: 40,
      thumbnailUrl:
          'https://images.pexels.com/photos/919734/pexels-photo-919734.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Apple Dev',
        avatarUrl:
            'https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg',
        isVerified: true,
      ),
      description:
          'Apple HLS advanced example with multiple audio/video tracks.',
      tags: ['demo', 'apple', 'bipbop'],
      uploadDate: '2022-01-03',
      location: 'Cupertino, CA',
      views: 1200,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_1a48335f-ea1e-47c7-819a-baa82e18042f.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 1',
      likes: 300,
      comments: 70,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
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
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_a903943a-d1bb-46c4-b02a-22b4477624d7.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 2',
      likes: 350,
      comments: 90,
      thumbnailUrl:
          'https://images.pexels.com/photos/23769/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 2',
        avatarUrl:
            'https://images.pexels.com/photos/1123972/pexels-photo-1123972.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: true,
      ),
      description: 'Another MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-07',
      location: 'Houston, TX',
      views: 5000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_7a633c51-42e3-45b1-9e63-6f8fe2b9966a.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 3',
      likes: 400,
      comments: 110,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 3',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'Yet another MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-08',
      location: 'New York, NY',
      views: 6000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/App_User__7253306_b21967b9-0727-4bc9-b77e-b6375c3b1e66.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 4',
      likes: 450,
      comments: 130,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 4',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A fourth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-09',
      location: 'San Francisco, CA',
      views: 7000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_dea3f288-7356-4467-9bfe-2b5177b183cb.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 5',
      likes: 500,
      comments: 150,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 5',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A fifth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-10',
      location: 'Los Angeles, CA',
      views: 8000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18953932_8afb9a5f-5a28-43d8-9c6d-6f1a039a90a0.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 6',
      likes: 550,
      comments: 170,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 6',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A sixth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-11',
      location: 'Houston, TX',
      views: 9000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2ae2a0e9-2a76-4bf2-a48a-81c9306a6ff6.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 7',
      likes: 600,
      comments: 190,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 7',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A seventh MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-12',
      location: 'Los Angeles, CA',
      views: 10000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_4e5fc1ae-ec35-40fb-8f53-c77d72cc5740.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 8',
      likes: 650,
      comments: 210,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 8',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'An eighth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-13',
      location: 'Houston, TX',
      views: 11000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_4bd0def8-4bb9-4b32-aee8-040100c7cc31.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 9',
      likes: 700,
      comments: 230,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 9',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A ninth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-14',
      location: 'New York, NY',
      views: 12000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_9bca46ca-cbea-46d3-a14a-d4e8f9753499.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 10',
      likes: 750,
      comments: 250,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 10',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A tenth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-15',
      location: 'San Francisco, CA',
      views: 13000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_9001776b-fab5-465e-89b2-e0a9fcfa60b8.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 11',
      likes: 800,
      comments: 270,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 11',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'An eleventh MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-16',
      location: 'Los Angeles, CA',
      views: 14000,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_8064305f-aece-48b7-babb-9a093601238a.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 12',
      likes: 850,
      comments: 290,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Video Author 12',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A twelfth MP4 video example.',
      tags: ['mp4', 'video', 'example'],
      uploadDate: '2022-01-17',
      location: 'Houston, TX',
      views: 15000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ReelsView(reels: reels));
  }
}
