import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/colors.dart';
import 'package:mindshield/Utilities/constants/images.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbutton.dart';

class PermissionHandler extends StatefulWidget {
  const PermissionHandler({super.key});

  @override
  State<PermissionHandler> createState() => _PermissionHandlerState();
}

class _PermissionHandlerState extends State<PermissionHandler> {
  // By Default All conditions False
  bool isSwitched = false;
  bool isCameraEnabled = false;
  bool isMicrophoneEnabled = false;
  bool isLocationEnabled = false;
  bool isStorageEnabled = false;
  bool isNotificationsEnabled = false;
  bool isContactsEnabled = false;
  bool isAccessibilityEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        permissionItem(
          icon: Icons.camera_alt,
          title: UTexts.cameraTitle,
          subtitle: UTexts.cameraSubtitle,
          value: isCameraEnabled,
          onChanged: (val) {
            setState(() {
              isCameraEnabled = val;
            });
          },
        ),
        permissionItem(
          icon: Icons.mic,
          title: UTexts.microphoneTitle,
          subtitle: UTexts.microphoneSubtitle,
          value: isMicrophoneEnabled, // current state
          onChanged: (val) {
            setState(() {
              isMicrophoneEnabled = val;
            });
          },
        ),
        permissionItem(
          icon: Icons.location_on,
          title: UTexts.locationTitle,
          subtitle: UTexts.locationSubtitle,
          value: isLocationEnabled, // current state
          onChanged: (val) {
            setState(() {
              isLocationEnabled = val;
            });
          },
        ),
        permissionItem(
          icon: Icons.storage_rounded,
          title: UTexts.storageTitle,
          subtitle: UTexts.storageSubtitle,
          value: isStorageEnabled, // current state
          onChanged: (val) {
            setState(() {
              isStorageEnabled = val;
            });
          },
        ),
        permissionItem(
          icon: Icons.notification_add_rounded,
          title: UTexts.notifyTitle,
          subtitle: UTexts.notifySubtitle,
          value: isNotificationsEnabled, // current state
          onChanged: (val) {
            setState(() {
              isNotificationsEnabled = val;
            });
          },
        ),
        permissionItem(
          icon: Icons.contacts_sharp,
          title: UTexts.contactTitle,
          subtitle: UTexts.contactSubtitle,
          value: isContactsEnabled, // current state
          onChanged: (val) {
            setState(() {
              isContactsEnabled = val;
            });
          },
        ),
        permissionItem(
          icon: Icons.accessibility_sharp,
          title: UTexts.accessibleTitle,
          subtitle: UTexts.accessibleSubtitle,
          value: isAccessibilityEnabled, // current state
          onChanged: (val) {
            setState(() {
              isAccessibilityEnabled = val;
            });
          },
        ),

        SizedBox(height: 10),

        Center(
          child: SizedBox(
            height: 160,
            width: 308, // image height adjust karo yahan
            child: Image.asset(UImages.privacyProtected, fit: BoxFit.contain),
          ),
        ),

        SizedBox(height: 20),

        ForgotButtonContainer(text: UTexts.continueButton, onPressed: () {}),
      ],
    );
  }

  Widget permissionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: UColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Section --> Padding / Sized box use plz
            Padding(
              padding: EdgeInsets.only(top: 2),
              child: Icon(icon, color: UColors.iconPrimary),
            ),
            const SizedBox(width: 15),

            // Text section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: UColors.subtextSecondary),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // ✅ Switch Section
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Switch(
                  value: value,
                  onChanged: onChanged,
                  activeThumbColor: Colors.white,
                  activeTrackColor: UColors.bprimary,

                  inactiveThumbColor: UColors.white,
                  inactiveTrackColor: UColors.haifwhite,

                  trackOutlineColor: WidgetStateProperty.all(
                    Colors.transparent,
                  ),
                  trackOutlineWidth: WidgetStateProperty.all(0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
