import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/common/widgets/button/rounded_rectangle_forward_elevated_button.dart';
import 'package:mindshield/features/screens/login/signup.dart';
import 'package:mindshield/features/screens/login/widgets/terms_splash.dart';
import 'package:mindshield/features/screens/login/login.dart';
import 'package:get/get.dart';

class LoginSplashScreen extends StatelessWidget {
  const LoginSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              UColors.primary_800, // Teal
              UColors.secondary, // White
            ],
            stops: [0.1, 0.6], // End > Begin Point
          ),
        ),
        child: Stack(
          children: [
            PageView(
              children: [
                NotifyPage(
                  subTitle: UTexts.loginSplashSubTitle,
                  title: UTexts.loginSplashTitle,
                  image: UImages.loginSplash,
                ),
              ],
            ),
            AuthButtons(),

            TermsText(),
          ],
        ),
      ),
    );
  }
}

class NotifyPage extends StatelessWidget {
  const NotifyPage({
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
        top: 100,
      ),
      child: Column(
        children: [
          // SubTitle
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle().copyWith(
              fontSize: 18.0,
              // fontWeight: FontWeight.bold,
              color: UColors.secondaryBlack,
            ),
          ),

          // Title
          Text(
            title,
            style: TextStyle().copyWith(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 25),

          Center(
            child: SizedBox(
              height: 220,
              width: 202, // image height adjust karo yahan
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),

          // // Image
          // Image.asset(image),
        ],
      ),
    );
  }
}

class AuthButtons extends StatelessWidget {
  final double topFraction;

  const AuthButtons({super.key, this.topFraction = 0.62});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * topFraction,
      left: 0,
      right: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Login Button: filled color, no border
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: USizes.spaceBtwItems,
              vertical: 10,
            ),
            child: UElevatedButton(
              onPressed:  () => Get.to(() => const LoginScreen()),
              backgroundColor: UColors.bprimary,
              textColor: Colors.white,
              elevation: 2,
              showBorder: false,
              child: const Text("Log in"),
            ),
          ),

          // Signup Button: white background, no shadow, black text, no border
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: USizes.spaceBtwItems,
              vertical: 0,
            ),
            child: UElevatedButton(
              onPressed: () => Get.to(() => const SignupScreen()),
              // onPressed: () => Get.to(() => const LoginScreen()),
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              textColor: UColors.textPrimary800,
              showBorder: false,
              elevation: 0,
              child: const Text("Sign up"),
            ),
          ),
        ],
      ),
    );
  }
}


//  Additional chnages ETC

// Isme kya change kiya:

// Image.asset ko SizedBox me wrap kiya aur height: 150 diya — isse image chhoti ho gayi.

// Center widget use kiya image ko horizontally center karne ke liye.

// mainAxisAlignment: MainAxisAlignment.center laga diya Column me taake vertical center ho jaye (agar aap full height me center chahte hain).

// SizedBox ke through vertical spacing manage kiya — padding/margin kam ho gayi.

// Agar chaho to image ki width bhi control kar sakte ho jaise:

// SizedBox(
//   height: 150,
//   width: 150,
//   child: Image.asset(image, fit: BoxFit.contain),
// )