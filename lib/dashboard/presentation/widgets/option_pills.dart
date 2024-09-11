import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_pdf/dashboard/application/dashboard_cubit/dashboard_cubit.dart';
import 'package:just_pdf/dashboard/domain/options.dart';
import 'package:just_pdf/dashboard/presentation/widgets/option_pill.dart';

class OptionPills extends StatelessWidget {
  const OptionPills({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) => SingleChildScrollView(
        child: Row(
            children: Options.values
                .map((e) => OptionPill(
                    onTap: () => e.onTap(context),
                    selected: state.maybeWhen(
                      lastSeenFiles: (_) =>
                          Options.lastSeen == e ? true : false,
                      alphabeticalOrderFiles: (_) =>
                          Options.alphabeticalOrder == e ? true : false,
                      orElse: () => false,
                    ),
                    text: e.getTitle(context)))
                .toList()),
      ),
    );
  }
}
