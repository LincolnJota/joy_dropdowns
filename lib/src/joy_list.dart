import 'package:flutter/material.dart';
import 'close_menu.dart';

class JoyMenu extends StatefulWidget {
  final List<JoyMenuItem> items;
  final Color? hoverColor;
  final Color? defaultColor;
  final BoxDecoration? menuDecoration;

  const JoyMenu(
      {Key? key,
      required this.items,
      this.hoverColor,
      this.defaultColor,
      this.menuDecoration})
      : super(key: key);

  @override
  State<JoyMenu> createState() => _JoyMenuState();
}

class _JoyMenuState extends State<JoyMenu> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: widget.menuDecoration,
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return Container(
              //padding: const EdgeInsets.only(left: 4),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: selectedIndex != index || selectedIndex == null
                      ? widget.defaultColor ??
                          Theme.of(context).colorScheme.primaryContainer
                      : widget.hoverColor ??
                          Theme.of(context).colorScheme.onPrimaryContainer),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    widget.items[index].onTap();
                    closeJoyDropDown(context);
                  },
                  onHover: (value) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Icon(widget.items[index].icon.icon,
                          color: widget.items[index].icon.color ??
                              Theme.of(context).colorScheme.onBackground,
                          size: widget.items[index].icon.size ?? 20),
                      const SizedBox(width: 10),
                      Text(
                        widget.items[index].title.data ?? '',
                        style: widget.items[index].title.style ??
                            Theme.of(context).textTheme.bodyText2?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class JoyMenuItem {
  JoyMenuItem({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  final Icon icon;
  final Text title;
  final Text? subtitle;
  final void Function() onTap;
}
