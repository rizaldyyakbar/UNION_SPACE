import 'package:flutter/material.dart';

class OnBoardingItem {
  final String image;
  final String title;
  final String description;

  const OnBoardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnBoardingController extends ChangeNotifier {
  bool isPressed = false;
  bool get _isPressed => isPressed;

  /// ==== DATA ON-BOARDING ====
  final List<OnBoardingItem> items = const [
    OnBoardingItem(
      image: 'assets/images/image 1.png',
      title: 'Terhubung. Berkembang.\nBersama',
      description:
          'Mewakili semangat kolaborasi dan pertumbuhan\nkomunitas profesional di Indonesia.',
    ),
    OnBoardingItem(
      image: 'assets/images/image 6.png',
      title: 'Ruangmu. Gayamu.\nBisnismu.',
      description:
          'Menekankan fleksibilitas dan personalisasi\nyang ditawarkan oleh UnionSpace.',
    ),
    OnBoardingItem(
      image: 'assets/images/image 7.png',
      title: 'Mulai Hari Produktifmu\nSekarang!',
      description:
          'Pendek, positif, dan langsung mengajak pengguna\nuntuk mulai beraktivitas.',
    ),
  ];

  /// ==== LOGIC ====
  final PageController pageController = PageController();
  int _current = 0;
  int get current => _current;

  int get totalPages => items.length;

  OnBoardingController() {
    pageController.addListener(_listener);
  }

  void _listener() {
    final page = pageController.page?.round() ?? 0;
    if (page != _current) {
      _current = page;
      notifyListeners();
    }
  }

  void next(BuildContext ctx) async {
    if (_current < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushReplacementNamed(ctx, '/landing'); // ganti rute
    }
  }

  void triggerPressed(
    VoidCallback onNavigate,
  ) async {
    isPressed = true;

    await Future.delayed(const Duration(milliseconds: 500));
    onNavigate();
  }

  @override
  void dispose() {
    pageController.removeListener(_listener);
    pageController.dispose();
    super.dispose();
  }
}
