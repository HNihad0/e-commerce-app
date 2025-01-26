import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_durations.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(AppDurations.s3, () {
      Go.replace(context, Pager.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeInLeftBig(
          duration: AppDurations.s2,
          child: Image.asset(
            AppAssets.logo,
            height: 225,
            width: 225,
          ),
        ),
      ),
    );
  }
}
