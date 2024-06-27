import 'package:flutter/material.dart';
import 'package:just_pdf/l10n/l10n.dart';

class JustPdfAppBar extends StatelessWidget implements PreferredSizeWidget{
  const JustPdfAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(T(context).app_name),
      notificationPredicate: (_) => false,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}