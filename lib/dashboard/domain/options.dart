import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_pdf/dashboard/application/dashboard_cubit/dashboard_cubit.dart';
import 'package:just_pdf/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'options.g.dart';

@HiveType(typeId: 1)
enum Options {
  @HiveField(0)
  lastSeen,
  @HiveField(1)
  alphabeticalOrder,
}

extension OptionsExtension on Options {
  String getTitle(BuildContext context) {
    switch (this) {
      case Options.lastSeen:
        return T(context).recently_viewed;
      case Options.alphabeticalOrder:
        return T(context).a_z;
    }
  }

  void onTap(BuildContext context){
    switch (this) {
      case Options.lastSeen:
        return context.read<DashboardCubit>().fetchLastSeenFiles();
      case Options.alphabeticalOrder:
        return context.read<DashboardCubit>().fetchAlphabeticalOrderFiles();
    }
  }
}
