import 'package:flutter/material.dart';
import 'package:just_pdf/l10n/l10n.dart';

enum Operations { print, share }

extension OperationsExtension on Operations {
  String getName(BuildContext context) {
    switch (this) {
      case Operations.print:
        return T(context).print;
      case Operations.share:
        return T(context).share;
    }
  }

  IconData getIcon() {
    switch (this) {
      case Operations.print:
        return Icons.print;
      case Operations.share:
        return Icons.share;
    }
  }
}
