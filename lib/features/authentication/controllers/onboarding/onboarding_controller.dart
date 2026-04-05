import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindshield/features/screens/allowNotification/allow_notification.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final PageController pageController = PageController(initialPage: 0);
  RxInt currentIndex = 0.obs;
  RxBool showBackButton = false.obs; // 👈 first page par hide
  bool get canGoBack => currentIndex.value > 0 && currentIndex.value != 5;

  // Update current index when page scrolls
  void updatePageIndicator(int index) {
    currentIndex.value = index;
  }

  // Jump to specific dot selected page
  void dotNavigationClick(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Go to next page
  void nextPage() async {
    if (currentIndex.value == 5) {
      Get.to(() => AllowNotificationsScreen());
      return;
    }

    final nextIndex = currentIndex.value + 1;

    await pageController.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    currentIndex.value = nextIndex;
  }

  void backPage() {
    if (!canGoBack) {
      // First page, no back
      return;
    } else {
      // Normal previous page
      currentIndex.value--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    // Update back button visibility
    showBackButton.value = currentIndex.value != 0; // 👈 first page hide
  }

  // Skip to last page
  void skipPage() {
    currentIndex.value = 5;
    pageController.jumpToPage(5);
  }

  // @override
  // void onClose() {
  //   pageController.dispose();
  //   super.onClose();
  // }
}
