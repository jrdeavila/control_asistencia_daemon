import 'package:control_asistencia_daemon/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Column(
          children: [
            DashboardHeader(
              title: state.title,
              hasBackButton: state is! DashboardInitial,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: child,
            ),
          ],
        );
      },
    );
  }
}

class DashboardHeader extends StatelessWidget {
  final String title;
  final bool hasBackButton;
  const DashboardHeader(
      {super.key, required this.title, this.hasBackButton = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (hasBackButton)
            BackButton(
              color: Theme.of(context).colorScheme.onPrimary,
              onPressed: () {
                BlocProvider.of<DashboardBloc>(context)
                    .add(DashboardShowInitialViewRequested());
              },
            ),
          const SizedBox(width: 16),
          const ClockTimer(),
          const Spacer(),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ],
      ),
    );
  }
}
