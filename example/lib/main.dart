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
          'https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8',
      videoType: VideoType.m3u8,
      title: 'Live Sports Demo',
      likes: 250,
      comments: 60,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Sports Channel',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A demo stream of a live sports broadcast.',
      tags: ['sports', 'live', 'demo'],
      uploadDate: '2022-01-04',
      location: 'Los Angeles, CA',
      views: 3000,
    ),
    Video(
      url:
          'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
      videoType: VideoType.m3u8,
      title: 'NASA Live',
      likes: 500,
      comments: 80,
      thumbnailUrl:
          'https://images.pexels.com/photos/23769/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'NASA',
        avatarUrl:
            'https://images.pexels.com/photos/1123972/pexels-photo-1123972.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: true,
      ),
      description: 'Live stream from NASA TV.',
      tags: ['nasa', 'space', 'live'],
      uploadDate: '2022-01-05',
      location: 'Houston, TX',
      views: 8000,
    ),
    Video(
      url:
          'https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8',
      videoType: VideoType.m3u8,
      title: 'Live Sports Demo',
      likes: 250,
      comments: 60,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Sports Channel',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A demo stream of a live sports broadcast.',
      tags: ['sports', 'live', 'demo'],
      uploadDate: '2022-01-04',
      location: 'Los Angeles, CA',
      views: 3000,
    ),
    Video(
      url:
          'https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8',
      videoType: VideoType.m3u8,
      title: 'Live Sports Demo',
      likes: 250,
      comments: 60,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Sports Channel',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A demo stream of a live sports broadcast.',
      tags: ['sports', 'live', 'demo'],
      uploadDate: '2022-01-04',
      location: 'Los Angeles, CA',
      views: 3000,
    ),
    Video(
      url:
          'https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8',
      videoType: VideoType.m3u8,
      title: 'Live Sports Demo',
      likes: 250,
      comments: 60,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Sports Channel',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A demo stream of a live sports broadcast.',
      tags: ['sports', 'live', 'demo'],
      uploadDate: '2022-01-04',
      location: 'Los Angeles, CA',
      views: 3000,
    ),
    Video(
      url:
          'https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8',
      videoType: VideoType.m3u8,
      title: 'Live Sports Demo',
      likes: 250,
      comments: 60,
      thumbnailUrl:
          'https://images.pexels.com/photos/2295744/pexels-photo-2295744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      author: Author(
        name: 'Demo Author',
        avatarUrl:
            'https://images.pexels.com/photos/1066987/pexels-photo-1066987.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isVerified: false,
      ),
      description: 'A demo stream of a movie broadcast.',
      tags: ['demo', 'movie', 'demo'],
      uploadDate: '2022-01-04',
      location: 'Los Angeles, CA',
      views: 3000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ReelsView(reels: reels));
  }
}
