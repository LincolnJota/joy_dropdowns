import 'dart:async';

import 'package:flutter/material.dart';

import 'overlay.dart';

void closeJoyDropDown(BuildContext context) {
  //canCloseMenu = true;
  // print('WidgetKey: ${context.widget.key}');
  // print('CurrentKey: $currentChildKey');
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
