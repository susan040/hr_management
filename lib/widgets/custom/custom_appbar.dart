import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_text_style.dart';


class CustomAppBar extends StatelessWidget  {
  final String title;
  final List<Widget>? actions;
  final Color? color;
  final VoidCallback? onBack;
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.color,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      leading: IconButton(
        onPressed: onBack ??
            () {
              Get.back();
            },
        icon: Icon(
          Icons.arrow_back,
          color: color ?? theme.colorScheme.onBackground,
        ),
      ),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        title,
        style: CustomTextStyles.f18W600(color: color ?? theme.colorScheme.onBackground),
      ),
      actions: actions,
    );
  }

  Size get preferredSize => const Size.fromHeight(80);
}
