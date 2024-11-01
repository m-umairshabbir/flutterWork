import 'package:flutter/material.dart';
import 'package:spotify_clone/Common/helpers/is_darkMode.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
  });

  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? Colors.white.withOpacity(0.04)
                : Colors.black.withOpacity(0.03),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.arrow_back_ios_new,color: context.isDarkMode?Colors.white:Colors.black,),
        ),
      ),

      title: title ?? const Text(''),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
