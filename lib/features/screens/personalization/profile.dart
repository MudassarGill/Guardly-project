import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotelevatedbutton.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileBodySection extends StatefulWidget {
  const ProfileBodySection({super.key});

  @override
  State<ProfileBodySection> createState() => _PBState();
}

class _PBState extends State<ProfileBodySection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
          children: [
            // row for Back Button
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Align(alignment: Alignment.centerLeft, child: BackButton()),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: UColors.borderPrimary,
                            width: 2,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            UImages.defaultProfile,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    //Spacing
                    SizedBox(height: 8),
                    // Profile Title
                    Text(
                      UTexts.addProfileTitle,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // Profile SubTitle
                    Text(
                      UTexts.tapToAddprofileSubtitle,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: UColors.subtextSecondaryBold,
                      ),
                    ),
                  ],
                ),
                // Mian Body Section
                bodySection(
                  title: UTexts.childName,
                  hintText: UTexts.enterChildName,
                ),
                bodySection(
                  title: UTexts.nickname,
                  hintText: UTexts.enterNickName,
                ),
                bodySection(title: UTexts.age, hintText: UTexts.selectAge),
                bodySection(title: UTexts.dOB, hintText: UTexts.enterDOB),
                // Spacing
                SizedBox(height: 10),
                // Spacing
                Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: USizes.defaultSpace,
                    right: USizes.defaultSpace,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //  Text
                      Text(
                        UTexts.gender,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Spacing
                      SizedBox(height: 10),
                      // Gender Selection
                      Row(
                        children: [
                          SizedBox(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: UColors.bprimary,
                              ),
                              child: Padding(
                                padding: EdgeInsetsGeometry.symmetric(
                                  vertical: 0,
                                  horizontal: 25,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person_2_outlined,
                                      size: 20,
                                      color: UColors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsGeometry.only(left: 4),
                                      child: Text(
                                        UTexts.male,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget bodySection({required String title, required String hintText}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(
        right: USizes.defaultSpace,
        left: USizes.defaultSpace,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Input Header Text
          Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          // Spacing
          SizedBox(height: 5),
          // Input Field Text
          TextFormField(
            decoration: InputDecoration(
              labelText: hintText,
              fillColor: UColors.white,
              filled: true,
            ),
          ),
        ],
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
