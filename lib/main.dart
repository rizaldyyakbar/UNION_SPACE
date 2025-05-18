import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/onboarding_controller.dart';
import '../../controller/landing_page_controller.dart';
import '../../UI/pages/on_boarding.dart';
import '../../UI/pages/landing_page.dart';
import '../../theme_page/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('Starting app - checking assets accessibility');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnBoardingController()),
        ChangeNotifierProvider(create: (_) => LandingPageController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UnionSpace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          // ignore: deprecated_member_use
          background: AppColors.background,
        ),
        scaffoldBackgroundColor: AppColors.background,
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        useMaterial3: true,
      ),
      home: const MyLanding(),
      routes: {
        '/MyLanding': (context) => const OnBoardingPage(),
      },
    );
  }
}
