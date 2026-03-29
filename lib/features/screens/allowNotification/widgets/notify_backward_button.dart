import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mindshield/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:mindshield/common/widgets/button/baclward_elevated_button.dart';
import 'package:get/get.dart';
// import 'package:mindshield/Utilities/constants/colors.dart';

// Next Button Widget
class NotifyBackButton extends StatelessWidget {
  const NotifyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: USizes.spaceBtwItems * 3,
      left: USizes.spaceBtwItems * 1.5,
      child: UBackElevatedButton(
        onPressed: () {
          Get.back(); 
        },
        child: SvgPicture.asset(
          "assets/notification/backward.svg",
          width: 34,
          height: 34,
          // colorFilter: const ColorFilter.mode(
          //   UColors.secondaryBlack,
          //   BlendMode.srcIn,
          // ),
        ),
      ),
    );
  }
}
