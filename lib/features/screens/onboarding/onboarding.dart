import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/common/widgets/button/u_elevated_button.dart';
import 'package:mindshield/features/screens/onboarding/widgets/onboarding_page.dart';
import 'package:mindshield/features/screens/onboarding/widgets/on_boarding_dot_indicators.dart';
import 'package:get/get.dart';
import 'package:mindshield/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.updatePageIndicator(index);

              // Hide back button only on first page
              controller.showBackButton.value = index != 0;
            },
            children: [
              OnboardingPage(
                image: UImages.onboarding1,
                title: UTexts.onboardingTitle1,
                subTitle: UTexts.onboardingSubTitle1,
              ),
              OnboardingPage(
                image: UImages.onboarding2,
                title: UTexts.onboardingTitle2,
                subTitle: UTexts.onboardingSubTitle2,
              ),
              OnboardingPage(
                image: UImages.onboarding3,
                title: UTexts.onboardingTitle3,
                subTitle: UTexts.onboardingSubTitle3,
              ),
              OnboardingPage(
                image: UImages.onboarding4,
                title: UTexts.onboardingTitle4,
                subTitle: UTexts.onboardingSubTitle4,
              ),
              OnboardingPage(
                image: UImages.onboarding5,
                title: UTexts.onboardingTitle5,
                subTitle: UTexts.onboardingSubTitle5,
              ),
              OnboardingPage(
                image: UImages.onboarding6,
                title: UTexts.onboardingTitle6,
                subTitle: UTexts.onboardingSubTitle6,
              ),
            ],
          ),

          // Indicator Dots
          OnBoardingDotNavigation(),

          // Next Button
          Positioned(
            // left: 0,
            right: USizes.spaceBtwItems * 1.5,
            bottom: USizes.spaceBtwItems * 3,
            child: UElevatedButton.circle(
              icon: Icons.arrow_forward,
              bPrimaryColor1: UColors.bprimary,
              bPrimaryColor2: UColors.green_800,
              onPressed: controller.nextPage,
              width: 65,
              height: 65,
              elevation: 1,
              // text: "Submit",
            ),
          ),

          // Skip Button
          // SkipButton(),
          Obx(
            () => controller.currentIndex.value == 5
                ? SizedBox()
                : Positioned(
                    top: 45,
                    right: USizes.spaceBtwItems,
                    child: UElevatedButton.textButton(
                      onPressed: controller.skipPage,
                      text: UTexts.skip,
                      textColor: UColors.bprimary,
                    ),
                  ),
          ),

          // Back Button
          Obx(() {
            // Show/hide button based on controller
            if (!controller.showBackButton.value) return const SizedBox();
            return Positioned(
              left: USizes.spaceBtwItems * 1.5,
              bottom: USizes.spaceBtwItems * 3,
              child: UElevatedButton.circle(
                icon: Icons.arrow_back,
                onPressed: controller.backPage,
                bPrimaryColor1: UColors.backButton_600,
                bPrimaryColor2: UColors.backButton_800,
                iconColor: UColors.backButton_800,
                width: 65, // Circle Width
                height: 65, // Circle Height
                elevation: 1,
                isVisible: controller.canGoBack,
              ),
            );
          }),
        ],
      ),
    );
  }
}
