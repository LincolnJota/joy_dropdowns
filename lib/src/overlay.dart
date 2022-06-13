import 'dart:async';

import 'package:flutter/material.dart';

import 'close_menu.dart';
import 'enums.dart';

OverlayEntry? overlayEntry;
bool isMenuShowing = false;
Timer? closeTimer;
Key? currentChildKey;

void showJoyDropDown({
  required BuildContext context,
  required Widget overlayWidget,
  required JoyOverlayPosition overlayPosition,
  required LayerLink layerLink,
  required Offset overlayOffset,
  required Key key,
  double? overlayHeight,
  double? overlayWidth,
}) {
  RenderBox? renderObject;

  overlayEntry = OverlayEntry(
    builder: (_) {
      renderObject = context.findRenderObject() as RenderBox;
      Alignment followerAnchor = Alignment.topLeft;
      Alignment targetAnchor = Alignment.topLeft;

      switch (overlayPosition) {
        case JoyOverlayPosition.top:
          followerAnchor = Alignment.bottomCenter; // Ancora do vermelho
          targetAnchor = Alignment.topCenter; // Ancora do azul
          break;
        case JoyOverlayPosition.bottom:
          followerAnchor = Alignment.topCenter; // Ancora do vermelho
          targetAnchor = Alignment.bottomCenter; // Ancora do azul
          break;
        case JoyOverlayPosition.left:
          followerAnchor = Alignment.topRight; // Ancora do vermelho
          targetAnchor = Alignment.topLeft; // Ancora do azul
          break;
        case JoyOverlayPosition.right:
          followerAnchor = Alignment.topLeft; // Ancora do vermelho
          targetAnchor = Alignment.topRight; // Ancora do azul
          break;
        default:
      }

      return Positioned(
        width: overlayWidth ?? renderObject!.size.width,
        height: overlayHeight ?? renderObject!.size.height,
        //left: pos.dx,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: overlayOffset,
          followerAnchor: followerAnchor,
          targetAnchor: targetAnchor,
          child: MouseRegion(
            onEnter: (event) {
              if (closeTimer != null) {
                closeTimer!.cancel();
              }
            },
            onExit: (event) {
              closeJoyDropDown(context);
            },
            child: Material(
                borderOnForeground: false,
                type: MaterialType.transparency,
                child: overlayWidget),
          ),
        ),
      );
    },
  );

  Overlay.of(context)!.insert(overlayEntry!);
  currentChildKey = key;
  isMenuShowing = true;
}
