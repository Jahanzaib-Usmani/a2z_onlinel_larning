import 'package:a2z_online_learning/AppTheme/custom_app_theme.dart';
import 'package:a2z_online_learning/CustomProvider/custom_theme_provider.dart';
import 'package:a2z_online_learning/firebase_options.dart';
import 'package:a2z_online_learning/pages/onboarding1.dart';
import 'package:a2z_online_learning/screens/Home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider<CustomThemeProvider>(
    create: (context) => CustomThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<CustomThemeProvider>(context).currentTheme,
        darkTheme: AppThemes.dark,
        // //system
        // themeMode: ,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomeScreen();
              } else
                return OnboardingPage1();
            }),
      );
    });
  }
}
