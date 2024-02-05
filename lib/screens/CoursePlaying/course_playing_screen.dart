// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart'
    as youtube_explode;

class CoursePlayScreen extends StatefulWidget {
  final String videoUrl;
  final String videoTitle;
  final String videoDuration;
  final String videoDescription;

  CoursePlayScreen({
    super.key,
    required this.videoUrl,
    required this.videoTitle,
    required this.videoDuration,
    required this.videoDescription,
  });

  @override
  _CoursePlayScreenState createState() => _CoursePlayScreenState();
}

class _CoursePlayScreenState extends State<CoursePlayScreen> {
  late YoutubePlayerController _controller;
  late String videoTitle = '';
  late String videoDuration = '';
  late String videoDescription = '';

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    _fetchVideoDetails();
  }

  Future<void> _fetchVideoDetails() async {
    try {
      var yt = youtube_explode.YoutubeExplode();
      var video = await yt.videos.get(widget.videoUrl);

      setState(() {
        videoTitle = video.title;
        videoDuration = video.duration.toString();
        videoDescription = video.description;
      });
    } catch (e) {
      print("Error fetching video details: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(videoTitle),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(videoTitle,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(
                  'Duration: $videoDuration',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 25.h,
                  child: SingleChildScrollView(
                    child: Text(
                      'Description: $videoDescription',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
}
