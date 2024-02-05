

/////----------- for playing videos from assets. ----- /// tested and then used youtube video.


// import 'package:flutter/material.dart';
// import 'package:chewie/chewie.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:video_player/video_player.dart';

// class CoursePlay extends StatefulWidget {
//   final String videoAssetPath;
//   final String videoTitle;
//   final String videoDuration;

//   CoursePlay({
//     required this.videoAssetPath,
//     required this.videoTitle,
//     required this.videoDuration,
//   });

//   @override
//   _CoursePlayState createState() => _CoursePlayState();
// }

// class _CoursePlayState extends State<CoursePlay> {
//   late VideoPlayerController _videoPlayerController;
//   late ChewieController _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     _videoPlayerController = VideoPlayerController.asset(widget.videoAssetPath);
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController,
//       aspectRatio: 16 / 9,
//       autoPlay: true,
//       looping: false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.videoTitle),
//       ),
//       body: Container(
//         height: 60.h,
//         width: 60.w,
//         child: ListView(
//           children: [
//             Container(
//                 height: 25.h,
//                 width: 75.w,
//                 child: Chewie(controller: _chewieController)),
//             SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.videoTitle,
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Duration: ${widget.videoDuration}',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }
// }
