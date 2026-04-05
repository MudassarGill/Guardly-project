import 'package:flutter/material.dart';
// import 'package:mindshield/Utilities/constants/sizes.dart';
// import 'package:mindshield/Utilities/helpers/device_helpers.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: USizes.defaultSpace,
        left: USizes.defaultSpace,
        // top: UDeviceHelper.getAppBarHeight(),
        top: 110,
      ),
      child: Column(
        children: [
          // Image
          Image.asset(image),
          const SizedBox(height: 100),
          // Title & SubTitle
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle().copyWith(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: UColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
