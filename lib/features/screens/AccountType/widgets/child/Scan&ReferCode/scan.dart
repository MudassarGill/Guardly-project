import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbackbutton.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbutton.dart';

class ChildScan extends StatelessWidget {
  const ChildScan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Back Button
          ForgotBackButton(),

          // Main Content
          ScanBody(),

          // Bottom Button
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 10,
            left: 0,
            right: 0,
            child: ForgotButtonContainer(
              text: UTexts.continueButton,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class ScanBody extends StatelessWidget {
  const ScanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: USizes.defaultSpace,
            right: USizes.defaultSpace,
            top: 140,
          ),
          child: Column(
            children: [
              // Title
              Text(
                UTexts.sQRCode,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: UColors.textPrimary800,
                ),
              ),
              // Subtitle
              Text(
                UTexts.scaning,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: UColors.subtext,
                ),
              ),
              // Scaning
              SizedBox(height: 50),
              Image(image: AssetImage(UImages.scaningFrame)),
            ],
          ),
        ),
      ],
    );
  }
}
