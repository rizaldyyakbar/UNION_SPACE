import 'package:flutter/material.dart';
import 'package:intern/UI/pages/on_boarding.dart';
import 'package:provider/provider.dart';
import '../../theme_page/constants.dart';
import '../../controller/landing_page_controller.dart';

class MyLanding extends StatefulWidget {
  const MyLanding({super.key});

  @override
  State<MyLanding> createState() => _MyLandingState();
}

class _MyLandingState extends State<MyLanding> {
  late LandingPageController controller;

  @override
  void initState() {
    super.initState();
    controller = Provider.of<LandingPageController>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _navigateToOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnBoardingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LandingPageController>(
        builder: (context, controller, _) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: controller.isPressed
                ? AppColors.primary // Yellow background when pressed
                : AppColors.background, // Default background
            child: Center(
              child: GestureDetector(
                onTap: () {
                  controller.triggerPressed(_navigateToOnboarding);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                    // Add error builder to help with debugging
                    errorBuilder: (context, error, stackTrace) {
                      print('Error loading logo: $error');
                      return Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'LOGO',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
