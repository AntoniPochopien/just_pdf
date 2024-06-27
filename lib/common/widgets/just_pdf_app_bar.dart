import 'package:flutter/material.dart';
import 'package:just_pdf/l10n/l10n.dart';

class JustPdfAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  const JustPdfAppBar({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(T(context).app_name),
      notificationPredicate: (_) => false,
      actions: [...actions ?? [], const SizedBox(width: 16)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
