import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/features/screens/AccountType/widgets/child/Scan&ReferCode/grantWidget/grantpermission.dart';
import 'package:mindshield/features/screens/AccountType/widgets/child/Scan&ReferCode/grantWidget/grantskipbutton.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotelevatedbutton.dart';

class GrantPermission extends StatelessWidget {
  const GrantPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
          children: [
            // Top Row
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: BackButton(),
                  ),
                ),

                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GrantSkipButton(),
                  ),
                ),
              ],
            ),

            // Title
            Text(
              UTexts.grantPermission,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),

            // Subtitle
            Text(
              UTexts.grantPermissionSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: UColors.textSecondary),
            ),

            SizedBox(height: 20),

            // Permission List
            PermissionHandler(),

          ],
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return UForgotElevatedButton(
      onPressed: () {
        Get.back();
      },
      child: SvgPicture.asset(
        "assets/notification/backward.svg",
        width: 34,
        height: 34,
        colorFilter: const ColorFilter.mode(
          UColors.secondaryBlack,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
