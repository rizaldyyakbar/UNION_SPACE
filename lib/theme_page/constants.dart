import 'package:flutter/widgets.dart';

class AppColors {
  static const Color primary = Color(0xFFFFD600); // Kuning terang
  static const Color secondary = Color(0xFF000000); // Hitam
  static const Color textPrimary = Color(0xFF4F4F4F); // Abu tua
  static const Color textSecondary = Color(0xFF828282); // Abu muda
  static const Color background = Color(0xFFFFFFFF); // Putih
  static const Color success = Color(0xFF00C853); // Hijau - status Available
  static const Color link = Color(0xFF007AFF); // Biru - link
  static const Color border = Color(0xFFE0E0E0); // Divider/border abu terang
}

class FontSizes {
  static const double H1 = 24.0;
  static const double H2 = 20.0;
  static const double H3 = 18.0;
  static const double H4 = 16.0;
  static const double H5 = 14.0;
  static const double H6 = 12.0;
  static const double Subhead1 = 16.0;
  static const double Subhead2 = 14.0;
  static const double Subhead3 = 12.0;
  static const double pharagraph1 = 16.0;
  static const double pharagraph2 = 14.0;
  static const double pharagraph3 = 14.0;
  static const double pharagraph4 = 12.0;
}

class AppPadding {
  static const double horizontal = 16.0;
  static const double vertical = 12.0;
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: horizontal,
    vertical: vertical,
  );
}
