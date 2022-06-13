import 'dart:async';
import 'package:flutter/material.dart';
import 'overlay.dart';

/// Function to remove any overlay or dropdown that is on the screen.
/// This function is useful if you want to close the menu when clicking on an item.
/// #### Example:
/// ```dart
/// InkWell(onTap: () {
///   closeJoyDropDown(context);
///   // Make a navigation, maybe..
///  },
/// );
///
/// ```
void closeJoyDropDown(BuildContext context) {
  if (overlayEntry != null) {
    closeTimer = Timer(const Duration(milliseconds: 100), () {
      isMenuShowing = false;
      overlayEntry?.remove();
      overlayEntry = null;
      closeTimer = null;
      //canCloseMenu = true;
    });
  }
}
