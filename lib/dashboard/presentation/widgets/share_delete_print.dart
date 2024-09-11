import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_pdf/dashboard/application/dashboard_cubit/dashboard_cubit.dart';

class ShareDeletePrint extends StatefulWidget {
  const ShareDeletePrint({super.key});

  @override
  State<ShareDeletePrint> createState() => _ShareDeletePrintState();
}

class _ShareDeletePrintState extends State<ShareDeletePrint>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
        listener: (context, state) {
          state.maybeWhen(
            filesSelection: (selectedFiles, allFiles) {
              if (selectedFiles.isNotEmpty) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
            orElse: () => _controller.reverse(),
          );
        },
        builder: (context, state) => state.maybeWhen(
              orElse: () => const SizedBox(),
              filesSelection: (selectedFiles, allFiles) => SizeTransition(
                sizeFactor: _animation,
                axisAlignment: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: selectedFiles.length == 1
                            ? IconButton(
                                icon: const Icon(Icons.print),
                                onPressed: () => context
                                    .read<DashboardCubit>()
                                    .printFile(selectedFiles.first))
                            : const SizedBox(width: 48),
                      ),
                      IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () => context
                              .read<DashboardCubit>()
                              .share(selectedFiles)),
                      IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () => context
                              .read<DashboardCubit>()
                              .deleteFiles(selectedFiles)),
                    ]),
              ),
            ));
  }
}
