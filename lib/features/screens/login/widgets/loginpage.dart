import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mindshield/Utilities/constants/images.dart';
// import 'package:mindshield/features/screens/allowNotification/allow_notification.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/common/widgets/button/rounded_rectangle_forward_elevated_button.dart';
import 'package:get/get.dart';
import 'package:mindshield/features/screens/forgotpassword/forgotpass.dart';
import 'package:mindshield/features/screens/login/signup.dart';
import 'package:mindshield/Utilities/theme/theme.dart';
import 'package:mindshield/features/screens/login/welcome.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: USizes.defaultSpace,
        left: USizes.defaultSpace,
        // top: UDeviceHelper.getAppBarHeight(),
        top: 80,
      ),
      child: Column(
        children: [
          /***************
          * HEADER PART *
           ***************/
          // ! Image
          Center(
            child: SizedBox(
              height: 110,
              width: 90, // image height adjust karo yahan
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),

          const SizedBox(height: 5),
          // !  Title
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),
          /***************
          * FORM PART *
           ***************/
          TextFormField(
            decoration: InputDecoration(
              labelText: UTexts.email,
              hintText: "Enter your email",
              filled: true,
              fillColor: UColors.light, // background
            ),
          ),

          SizedBox(height: USizes.spaceBtwInputFields),

          TextFormField(
            decoration: InputDecoration(
              // prefix: Icon(Iconsax.direct_right),
              labelText: UTexts.password,
              hintText: "Enter your Password",
              suffixIcon: Icon(Iconsax.eye),
              filled: true,
              fillColor: UColors.light, // background
            ),
          ),

          //         Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text(UTexts.rememberMe),
                ],
              ),

              //  Forget Password
              TextButton(
                onPressed: () => Get.to(() => const ForgotMainScreen()),
                child: Text(
                  UTexts.forgetPassword,
                  style: TextStyle().copyWith(
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF009688),
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    decorationColor: Color(0xFF009688),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          // SignIn
          UElevatedButton(
            onPressed: () => Get.to(() => const WellcomeScreen()),
            child: Text(UTexts.logIn),
          ),
          SizedBox(height: USizes.spaceBtwItems / 2),
          // Create Account Button

          /***************
          * DIVIDER PART *
           ***************/
          SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: Divider(indent: 10, endIndent: 5, thickness: 0.5),
              ),
              Text(
                UTexts.orSignInWith,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Expanded(
                child: Divider(indent: 5, endIndent: 10, thickness: 0.5),
              ),
            ],
          ),

          SizedBox(height: 10),

          Center(
            child: Row(
              mainAxisSize: MainAxisSize
                  .min, // [icon][text]__________________________________ Space So Instaed Of max We use Min
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(UImages.google),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    UTexts.cWAccount,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Row(
              mainAxisSize: MainAxisSize
                  .min, // [icon][text]__________________________________ Space So Instaed Of max We use Min
              children: [
                Text(
                  UTexts.cWOAccount,
                  style: TextStyle().copyWith(
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                  ),
                ),

                TextButton(
                  onPressed: () => Get.to(() => SignupScreen()),
                  child: Text(
                    UTexts.signUp,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF009688),
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: Color(0xFF009688),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /***************
          * FOOTER PART *
           ***************/
        ],
      ),
    );
  }
}
