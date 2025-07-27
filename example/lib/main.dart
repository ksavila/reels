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
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_1a48335f-ea1e-47c7-819a-baa82e18042f.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 1',
      likes: 300,
      comments: 70,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_1a48335f-ea1e-47c7-819a-baa82e18042f.jpg',
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
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_a903943a-d1bb-46c4-b02a-22b4477624d7.jpg',
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
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_7a633c51-42e3-45b1-9e63-6f8fe2b9966a.jpg',
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
          'https://d1emoorn8v9q47.cloudfront.net/thumb_App_User__7253306_b21967b9-0727-4bc9-b77e-b6375c3b1e66.jpg',
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
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_dea3f288-7356-4467-9bfe-2b5177b183cb.jpg',
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
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18953932_8afb9a5f-5a28-43d8-9c6d-6f1a039a90a0.jpg',
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
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_2ae2a0e9-2a76-4bf2-a48a-81c9306a6ff6.jpg',
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
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_4e5fc1ae-ec35-40fb-8f53-c77d72cc5740.jpg',
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
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_4bd0def8-4bb9-4b32-aee8-040100c7cc31.jpg',
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
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_9bca46ca-cbea-46d3-a14a-d4e8f9753499.jpg',
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
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_9001776b-fab5-465e-89b2-e0a9fcfa60b8.jpg',
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
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_8064305f-aece-48b7-babb-9a093601238a.jpg',
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
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_17f1114c-db45-4cdd-8cca-eab8f62baf5e.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_17f1114c-db45-4cdd-8cca-eab8f62baf5e.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-13',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_e8a41f00-a022-4461-8ed4-ac02c95c07ad.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_e8a41f00-a022-4461-8ed4-ac02c95c07ad.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-06-30',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__7253306_f75ee3e1-de31-40a5-a8d3-53240a41a3d5.mp4',
      videoType: VideoType.network,
      title: 'RandomStuff',
      likes: 24,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__7253306_f75ee3e1-de31-40a5-a8d3-53240a41a3d5.jpg',
      author: Author(
        name: 'RandomStuff',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__7253306_7e180c6d-2f53-459a-80cc-c66e98bfd175.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-03-27',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954012_f7b161a9-84d6-44ae-8e6b-790201aa5ce1.mp4',
      videoType: VideoType.network,
      title: 'RandomStuff',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954012_f7b161a9-84d6-44ae-8e6b-790201aa5ce1.jpg',
      author: Author(
        name: 'RandomStuff',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__7253306_7e180c6d-2f53-459a-80cc-c66e98bfd175.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-25',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_79466f7f-a5a9-44e3-9c49-0e1186d94648.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_79466f7f-a5a9-44e3-9c49-0e1186d94648.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-10',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_368382a1-0c3a-4cbc-b62e-1575876f16c6.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_368382a1-0c3a-4cbc-b62e-1575876f16c6.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-03',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_7be863c1-ae81-4910-bb85-7a01c4fd1ba6.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 0,
      comments: 0,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_7be863c1-ae81-4910-bb85-7a01c4fd1ba6.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-25',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_82f02000-5119-4189-96c2-96bdd28095ab.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_82f02000-5119-4189-96c2-96bdd28095ab.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-10',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_9db2bc17-94f3-4aed-a81e-453b1a6d8978.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_9db2bc17-94f3-4aed-a81e-453b1a6d8978.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-10',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_086d4502-fdc5-4614-a750-0e0a7a0ebee8.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_086d4502-fdc5-4614-a750-0e0a7a0ebee8.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-10',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954192_314cd96a-2cae-4220-ba2c-5228015714a4.mp4',
      videoType: VideoType.network,
      title: 'Best Of Jamaica & The Caribbean',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954192_314cd96a-2cae-4220-ba2c-5228015714a4.jpg',
      author: Author(
        name: 'Best Of Jamaica & The Caribbean',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954192_03d2a386-56b3-451f-8ed5-1787fac9f4a2.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-10',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18953889_ec464dcf-6553-469f-8bb0-c5b36666eb7a.mp4',
      videoType: VideoType.network,
      title: 'Lilfangz',
      likes: 11,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18953889_ec464dcf-6553-469f-8bb0-c5b36666eb7a.jpg',
      author: Author(
        name: 'Lilfangz',
        avatarUrl: 'img/icons/Channel_Icon.png',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-03-26',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_9e843294-f4ea-4e43-9aff-126cc6c7c359.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 8,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_9e843294-f4ea-4e43-9aff-126cc6c7c359.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-06-28',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_0e69440d-aceb-488e-8fad-2ca76649c5c9.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_0e69440d-aceb-488e-8fad-2ca76649c5c9.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-06-28',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_9001776b-fab5-465e-89b2-e0a9fcfa60b8.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_9001776b-fab5-465e-89b2-e0a9fcfa60b8.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-13',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_9da0feac-3b80-4668-b6a4-93ba20e11a49.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 0,
      comments: 0,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_9da0feac-3b80-4668-b6a4-93ba20e11a49.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-21',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_f732b8dc-ac87-4843-97fa-7aaf25b8dcb5.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_f732b8dc-ac87-4843-97fa-7aaf25b8dcb5.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-25',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_eeca58cb-1421-4496-a8ad-49dafb521e48.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_eeca58cb-1421-4496-a8ad-49dafb521e48.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-25',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_52c36033-6207-4fea-aeb1-2dd2ecf9b617.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 3,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_52c36033-6207-4fea-aeb1-2dd2ecf9b617.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-10',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954019_ba0e9533-1512-4bba-9cfd-3f1a3acc1c51.mp4',
      videoType: VideoType.network,
      title: 'AAK music FACTORY',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954019_ba0e9533-1512-4bba-9cfd-3f1a3acc1c51.jpg',
      author: Author(
        name: 'AAK music FACTORY',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__7253306_6cbcb93f-851e-46bc-b793-3cf889f1cd59.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-12',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_ce89a377-928e-45cd-8fba-a97131f249ed.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_ce89a377-928e-45cd-8fba-a97131f249ed.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-10',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954012_b98faca3-a12b-4355-bcc5-6d6b9eac4443.mp4',
      videoType: VideoType.network,
      title: 'RandomStuff',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954012_b98faca3-a12b-4355-bcc5-6d6b9eac4443.jpg',
      author: Author(
        name: 'RandomStuff',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__7253306_7e180c6d-2f53-459a-80cc-c66e98bfd175.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-23',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18953932_817fc7f4-b896-4ad2-934c-1af2a13f92a0.mp4',
      videoType: VideoType.network,
      title: 'KRs ',
      likes: 18,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18953932_817fc7f4-b896-4ad2-934c-1af2a13f92a0.jpg',
      author: Author(
        name: 'KRs ',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954022_5862d756-6e2b-4035-8630-d7bc08776f26.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-03-26',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_0cb4e9c9-f8be-455f-abc6-f51d3389e9c6.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_0cb4e9c9-f8be-455f-abc6-f51d3389e9c6.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-23',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_e0d6cfb9-cfde-41be-bb22-4c1b18f62955.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_e0d6cfb9-cfde-41be-bb22-4c1b18f62955.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-10',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_6e33b31c-3bb2-41e1-adfd-5a35f33c5a30.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 0,
      comments: 0,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_6e33b31c-3bb2-41e1-adfd-5a35f33c5a30.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-25',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954022_e9e4e2a4-2ec5-4868-8410-90ce63cf386d.mp4',
      videoType: VideoType.network,
      title: 'KRs ',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954022_e9e4e2a4-2ec5-4868-8410-90ce63cf386d.jpg',
      author: Author(
        name: 'KRs ',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954022_5862d756-6e2b-4035-8630-d7bc08776f26.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-24',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954022_02153a4f-16f1-430b-ae03-11fc1dcd6411.mp4',
      videoType: VideoType.network,
      title: 'KRs ',
      likes: 0,
      comments: 0,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954022_02153a4f-16f1-430b-ae03-11fc1dcd6411.jpg',
      author: Author(
        name: 'KRs ',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954022_5862d756-6e2b-4035-8630-d7bc08776f26.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-26',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_695800aa-f21f-44d4-9e5f-a68d1fea97b8.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_695800aa-f21f-44d4-9e5f-a68d1fea97b8.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-10',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_336a26c7-055c-414b-ae70-945fb2ae8422.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 0,
      comments: 0,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_336a26c7-055c-414b-ae70-945fb2ae8422.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-25',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_dfeaa42c-4dbf-4896-8295-e7f3fbef676f.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_dfeaa42c-4dbf-4896-8295-e7f3fbef676f.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-13',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_677f3f2f-1e1b-4a26-a56e-c910bbe6d926.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_677f3f2f-1e1b-4a26-a56e-c910bbe6d926.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-10',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_fbdf11b7-8b8d-40f8-9bb9-f6326c722887.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_fbdf11b7-8b8d-40f8-9bb9-f6326c722887.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-10',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_f9744202-641c-4225-98ed-f1e5117a72e1.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 0,
      comments: 0,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_f9744202-641c-4225-98ed-f1e5117a72e1.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-25',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_f8a58a5d-4071-4951-8784-9b739f070212.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_f8a58a5d-4071-4951-8784-9b739f070212.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-10',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954022_3db6a14a-d5fc-4d06-81f1-2897e7b8f4d1.mp4',
      videoType: VideoType.network,
      title: 'KRs ',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954022_3db6a14a-d5fc-4d06-81f1-2897e7b8f4d1.jpg',
      author: Author(
        name: 'KRs ',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954022_5862d756-6e2b-4035-8630-d7bc08776f26.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-23',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_3aeb166f-916e-4068-9834-c0802eb04405.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_3aeb166f-916e-4068-9834-c0802eb04405.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-21',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_667bd66f-1e4d-4c41-9d66-9cb82bca9467.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 0,
      comments: 0,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_667bd66f-1e4d-4c41-9d66-9cb82bca9467.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-25',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_eab3df97-2ae2-458f-a663-c51570552282.mp4',
      videoType: VideoType.network,
      title: 'Best Filks Of The Week SS',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954171_eab3df97-2ae2-458f-a663-c51570552282.jpg',
      author: Author(
        name: 'Best Filks Of The Week SS',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_2beac5ad-3602-448b-85e4-a08280314778.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-13',
      location: '',
      views: 0,
    ),
    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954022_e45f9349-5620-42ba-b60c-9ecf2c1eabf3.mp4',
      videoType: VideoType.network,
      title: 'KRs ',
      likes: 1,
      comments: 1,
      thumbnailUrl:
          'https://d1emoorn8v9q47.cloudfront.net/thumb_app_user__18954022_e45f9349-5620-42ba-b60c-9ecf2c1eabf3.jpg',
      author: Author(
        name: 'KRs ',
        avatarUrl:
            'https://d1emoorn8v9q47.cloudfront.net/app_user__18954022_5862d756-6e2b-4035-8630-d7bc08776f26.jpg',
        isVerified: false,
      ),
      description: '',
      tags: ['video', 'example'],
      uploadDate: '2025-07-15',
      location: '',
      views: 0,
    ),

    Video(
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_1a48335f-ea1e-47c7-819a-baa82e18042f.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 1',
      likes: 300,
      comments: 70,
      thumbnailUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
      url:
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_1a48335f-ea1e-47c7-819a-baa82e18042f.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 1',
      likes: 300,
      comments: 70,
      thumbnailUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://d1emoorn8v9q47.cloudfront.net/app_user__18954171_4bd0def8-4bb9-4b32-aee8-040100c7cc31.mp4',
      videoType: VideoType.network,
      title: 'MP4 Video 9',
      likes: 700,
      comments: 230,
      thumbnailUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
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
