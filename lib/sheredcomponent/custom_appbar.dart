import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showSearch;
  final bool showCompare;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onComparePressed;

  const CustomAppBar({
    super.key,
    this.showSearch = false,
    this.showCompare = false,
    this.onMenuPressed,
    this.onSearchPressed,
    this.onComparePressed,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,

      leadingWidth:1,
      leading: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: onMenuPressed,
          ),

          if (showSearch)
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: onSearchPressed,
            ),

          if (showCompare)
            IconButton(
              icon: Icon(Icons.swap_horiz, color: Colors.black),
              onPressed: onComparePressed,
            ),
        ],
      ),

      title: null,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(
            "assets/images/logo.png",
            height: 30,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}