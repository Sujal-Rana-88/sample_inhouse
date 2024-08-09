import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/constants/app_icon.dart';

class CommonHeader extends StatelessWidget {
  const CommonHeader({
    super.key,
  });

  // Define static colors and styles
  static const Color gradientColorPrimary = Color(0xFF42A5F5); // Example color
  static const Color gradientColorSecondary =
      Color(0xFF1E88E5); // Example color
  static const Color iconColor = Color(0xFF616161); // Example color
  static const Color textColor = Color(0xFF212121); // Example color
  static const TextStyle textStyle16w600 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textColor,
  );
  static const TextStyle textStyle10w400 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: textColor,
  );
  static const TextStyle textStyle16w400 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textColor,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [gradientColorPrimary, gradientColorSecondary],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed('/set-location'); // Adjust the route name
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: SvgPicture.asset(
                            'assets/icons/black_location_icon.svg',
                            // Example SVG path
                            color: iconColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Abhishek Jaiswal",
                              style: textStyle16w600),
                          const Text("B145 noida", style: textStyle10w400),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: Navigator.of(context).pop,
                        child: SvgPicture.asset(
                          AppIcon.backIcon, // Example SVG path
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
