import 'package:flutter/material.dart';

import '../../ui/screens/home/home_screen.dart';
import '../../ui/screens/splash/splash_screen.dart';

class Pager {
  Pager._();

  static Widget get splash => const SplashScreen();

  static Widget get home => const HomeScreen();
}
