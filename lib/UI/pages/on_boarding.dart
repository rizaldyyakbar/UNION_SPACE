import 'package:flutter/material.dart';
import 'package:intern/UI/pages/loading_page.dart';
import 'package:provider/provider.dart';
import '../../controller/onboarding_controller.dart';
import '../../theme_page/constants.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late OnBoardingController controller;

  @override
  void initState() {
    super.initState();
    controller = Provider.of<OnBoardingController>(context, listen: false);
  }

  void navigateToLoading() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyLoading()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.items.length,
                onPageChanged: (index) => setState(() {}),
                itemBuilder: (context, i) {
                  final item = controller.items[i];
                  return _buildPage(
                    image: item.image,
                    title: item.title,
                    desc: item.description,
                  );
                },
              ),
            ),
            _buildDots(),
            const SizedBox(
              height: 24,
              width: double.infinity,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    if (controller.current < controller.items.length - 1) {
                      controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      navigateToLoading();
                    }
                  },
                  child: Text(controller.current < controller.items.length - 1
                      ? 'Selanjutnya'
                      : 'Mulai Sekarang'),
                )),
            const SizedBox(
              height: 32,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String desc,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            child: Image.asset(
              image,
              height: 450,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                print('Error loading image: $image');
                print('Error details: $error');
                return Container(
                  height: 320,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Text('Image not found'),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 100),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        controller.totalPages,
        (i) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: i == controller.current ? 16 : 6,
          height: 6,
          decoration: BoxDecoration(
            color:
                i == controller.current ? AppColors.primary : AppColors.border,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
