import 'package:flutter/material.dart';
import 'joy_list.dart';
import 'close_menu.dart';
import 'overlay.dart';
import 'enums.dart';

class JoyDropDown extends StatefulWidget {
  final Widget child;
  final Widget overlayWidget;
  final JoyOverlayPosition? overlayPosition;
  final Offset? overlayOffset;
  final double? overlayWidth;
  final double? overlayHeight;
  final UniqueKey uniqueKey = UniqueKey();

  /// ## JoyDropDown
  /// Creates a widget that has your child as a "hoverable" Here are some properties available:
  /// - ``overlayWidget``: Widget you want to appear at the time of hovering over the mouse..
  /// - ``overlayPosition``: Position of the overlayWidget. Default is JoyOverlayPosition.bottom.
  /// - ``overlayOffset``: Offset of the overlayWidget. Default is Offset(0, 0).
  /// - ``overlayWidth``: If this parameter is not set, it will be the same as the child width.
  /// - ``overlayHeight``: If this parameter is not set, it will be the same as the child height.
  /// - ``child``: Widget that will be hovered. better known as button.
  // ignore: use_key_in_widget_constructors
  JoyDropDown({
    required this.child,
    required this.overlayWidget,
    this.overlayPosition,
    this.overlayOffset,
    this.overlayWidth,
    this.overlayHeight,
  });

  /// ## JoyDropDown.list
  /// Creates a widget that has your child as a "hoverable" Here are some properties available:
  /// - ``menu``: Widget you want to appear at the time of hovering over the mouse..
  /// - ``overlayPosition``: Position of the overlayWidget. Default is JoyOverlayPosition.bottom.
  /// - ``overlayOffset``: Offset of the overlayWidget. Default is Offset(0, 0).
  /// - ``overlayWidth``: If this parameter is not set, it will be the same as the child width.
  /// - ``overlayHeight``: If this parameter is not set, it will be the same as the child height.
  /// - ``child``: Widget that will be hovered. better known as button.
  factory JoyDropDown.list({
    required JoyOverlayPosition overlayPosition,
    required JoyMenu menu,
    required Widget child,
    Offset? overlayOffset,
    double? overlayWidth,
    double? overlayHeight,
  }) {
    return JoyDropDown(
      overlayWidget: menu,
      overlayPosition: overlayPosition,
      overlayOffset: overlayOffset ?? Offset.zero,
      overlayWidth: overlayWidth ?? 200,
      overlayHeight: overlayHeight ?? 200,
      child: child,
    );
  }

  @override
  State<JoyDropDown> createState() => _JoyDropDownState();
}

class _JoyDropDownState extends State<JoyDropDown> {
  LayerLink link = LayerLink();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        if (closeTimer != null) {
          closeTimer!.cancel();
        }

        if (!isMenuShowing || widget.uniqueKey != currentChildKey) {
          if (overlayEntry != null) {
            isMenuShowing = false;
            overlayEntry!.remove();
            overlayEntry = null;
          }

          showJoyDropDown(
            context: context,
            overlayWidget: widget.overlayWidget,
            overlayPosition:
                widget.overlayPosition ?? JoyOverlayPosition.bottom,
            overlayOffset: widget.overlayOffset ?? Offset.zero,
            overlayHeight: widget.overlayHeight,
            overlayWidth: widget.overlayWidth,
            layerLink: link,
            key: widget.uniqueKey,
          );
        }
      },
      onExit: (event) async {
        closeJoyDropDown(context);
      },
      child: CompositedTransformTarget(
        link: link,
        child: widget.child,
      ),
    );
  }
}
