import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_pdf/l10n/application/cubit/language_cubit.dart';
import 'package:just_pdf/l10n/l10n.dart';

class LanguageChangeButton extends StatelessWidget {
  const LanguageChangeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: const Icon(Icons.language),
      itemBuilder: (context) => L10n.supported
          .map((e) => PopupMenuItem(
              value: e, child: Text(L10n.getNativeLangName(e.languageCode))))
          .toList(),
      onSelected: (value) =>
          context.read<LanguageCubit>().setLocale(locale: value),
    );
  }
}
