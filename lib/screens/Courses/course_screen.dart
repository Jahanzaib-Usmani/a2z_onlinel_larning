// ignore_for_file: unused_field

import 'package:a2z_online_learning/CustomWidgets/custom_card.dart';
import 'package:a2z_online_learning/Model/courses_model.dart';
import 'package:a2z_online_learning/Utils/AppConstant.dart';
import 'package:a2z_online_learning/screens/CoursePlaying/course_playing_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final List<CourseCardModel> courseList = [
    CourseCardModel(
        videoUrl:
            'https://www.youtube.com/watch?v=gbHK4dN7xJc&list=PL5jb9EteFAODi35jPznP37hnR2sTHOOTU',
        videoTitle: 'Flutter',
        videoDuration: '4.55 Minutes',
        videoDescription: '',
        imageUrl: '${AppConstants.assetsImages}flutter37.png',
        heading: 'Flutter',
        iconText: 'Abdul Qadir',
        price: '\$250.0'),
    CourseCardModel(
        videoUrl:
            'https://www.youtube.com/watch?v=MBl-3Yb30FA&list=PL9ooVrP1hQOEeFvW5KaSea6mrlEU6TZ9s',
        videoTitle: 'RPA',
        videoDuration: '4.55 Minutes',
        videoDescription: '',
        imageUrl: '${AppConstants.assetsImages}RPA.png',
        heading: 'RPA',
        iconText: 'Asfand Yaar',
        price: '\$100.0'),
    CourseCardModel(
        videoUrl: 'https://www.youtube.com/watch?v=WGJJIrtnfpk',
        videoTitle: 'Python',
        videoDuration: '4.55 Minutes',
        videoDescription: '',
        imageUrl: '${AppConstants.assetsImages}python.png',
        heading: 'Python',
        iconText: 'Ammar Khan',
        price: '\$150.0'),
    CourseCardModel(
        videoUrl: 'https://www.youtube.com/watch?v=hQcFE0RD0cQ',
        videoTitle: 'DevOps',
        videoDuration: '4.55 Minutes',
        videoDescription: '',
        imageUrl: '${AppConstants.assetsImages}devops.png',
        heading: 'DevOps',
        iconText: 'Ahmad Hassan',
        price: '\$200.0'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 25.h,
            child: Padding(
              padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    'Courses',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Spacer(),
                  Center(
                    child: CircleAvatar(
                      radius: 5.h,
                      backgroundImage:
                          NetworkImage(_auth.currentUser?.photoURL ?? ''),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomCard(
                    imageName: '${AppConstants.assetsImages}getStarted1.png',
                    headingText: "What do you want to learn today?",
                    buttonWidget: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {
                        // Add your button onPressed logic here
                      },
                      child: Text('Get Started'),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  CustomCard(
                    imageName: '${AppConstants.assetsImages}getStarted2.png',
                    headingText: "Start from where you left.",
                    buttonWidget: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {},
                      child: Text('Resume'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.w, right: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Choose your course',
                    style: Theme.of(context).textTheme.titleMedium),
                Container(
                  height: 33.2.h,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: courseList.length,
                    itemBuilder: (BuildContext context, int index) =>
                        customCard(context, index),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CoursePlayScreen(
                    videoUrl: courseList[index].videoUrl,
                    videoTitle: courseList[index].videoTitle,
                    videoDuration: courseList[index].videoDuration,
                    videoDescription: courseList[index].videoDescription,
                  )),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        elevation: 4,
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  (courseList[index].imageUrl),
                  width: 70,
                  height: 70,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseList[index].heading,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.person,
                            color: Theme.of(context).colorScheme.onBackground),
                        SizedBox(width: 4),
                        Text(courseList[index].iconText),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      courseList[index].price,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
