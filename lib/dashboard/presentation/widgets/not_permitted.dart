import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_pdf/dashboard/application/cubit/dashboard_cubit.dart';
import 'package:just_pdf/l10n/l10n.dart';

class NotPermitted extends StatelessWidget {
  const NotPermitted({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(T(context).no_access_to_external_memory),
        const SizedBox(height: 24),
        ElevatedButton(
            onPressed: () => context.read<DashboardCubit>().init(),
            child: Text(T(context).give_permission))
      ]),
    );
  }
}
