import 'package:flutter/material.dart';

import '../utils/my_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final Widget? searchbar;
  final List<Widget>? actions;

  const CustomAppBar({super.key, this.leading, required this.title, this.searchbar, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Row(
        children: [
          Expanded(child: Text(
            title,
            style: const TextStyle(color: MyColors.whiteColor),
            overflow: TextOverflow.ellipsis,
          ),),
          if (searchbar != null) searchbar!,
        ],
      ),
      backgroundColor: MyColors.primaryColor,
      iconTheme: const IconThemeData(color: MyColors.whiteColor),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
