import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/theme/theme.dart';
import 'package:get/get.dart';
import 'package:mindshield/features/screens/personalization/profile.dart';

class GrantSkipButton extends StatelessWidget {
  const GrantSkipButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextButton(
          onPressed: () => Get.to(() => Profile()),
          child: Text(
            "Skip>>",
            style: TextStyle(
              color: UColors.bprimary,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
