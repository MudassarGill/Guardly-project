import 'package:flutter/material.dart';
// import 'package:mindshield/Utilities/constants/sizes.dart';
// import 'package:mindshield/Utilities/helpers/device_helpers.dart';
// import 'package:mindshield/Utilities/constants/colors.dart';

class UBackElevatedButton extends StatelessWidget {
  const UBackElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: UDeviceHelper.getScreenWidth(context),
      child: ElevatedButton(
        onPressed: onPressed,
        style:
            ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent, // ❌ shadow remove
              elevation: 0, // ❌ elevation remove
              shape: const CircleBorder(),
            ).copyWith(
              overlayColor: WidgetStateProperty.all(
                Colors.transparent,
              ), // ❌ splash + highlight remove
            ),
        child: child,
      ),
    );
  }
}
