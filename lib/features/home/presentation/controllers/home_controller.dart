import 'package:flutter/material.dart';

/// Controller for the home page
/// Handles navigation between sections and manages PageController state
/// This follows the MVVM pattern by separating business logic from UI
class HomeController {
  HomeController({required this.pageController});

  final PageController pageController;

  /// The current page index (0-3)
  int get currentPage {
    if (!pageController.hasClients) return 0;
    return pageController.page?.round() ?? 0;
  }

  void navigateToPage(int pageIndex) {
    pageController.animateToPage(pageIndex, duration: const Duration(milliseconds: 300), curve: Curves.easeOutCubic);
  }

  final sectionLookup = <String, int>{
    "overview": 0,
    "all": 1,
    "urgent": 2,
    "settings": 3,
    };

  void navigateToSection(String sectionName) {
    int? page = 0;
    page = sectionLookup[sectionName.toLowerCase()];

    if(page == null) {
      navigateToPage(0);
    } else {
      navigateToPage(page);
    }
  }

  /// Disposes of the PageController
  /// Should be called when the controller is no longer needed
  void dispose() {
    pageController.dispose();
  }
}
