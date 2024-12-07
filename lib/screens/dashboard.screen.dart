import 'package:control_asistencia_daemon/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  final List<Role> roles;
  final List<Permission> permissions;
  const DashboardScreen(
      {super.key, required this.roles, required this.permissions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          _buildTitle(context),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Center(
              child: _buildTouchButton(context),
            ),
          ),
        ],
      ),
    );
  }

// Marcar huella
  Widget _buildTouchButton(context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<MyAssistanceBloc>(context)
            .add(const MyAssistanceTakeAPicture());
      },
      child: BlocBuilder<MyAssistanceBloc, MyAssistanceState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(20.0),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20.0)),
            child: state is MyAssistanceSendingRequest
                ? LoadingIndicator(
                    size: 100,
                    color: Theme.of(context).colorScheme.onPrimary,
                    label: null,
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fingerprint,
                        size: 100.0,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text("Marcar huella",
                          style: Theme.of(context).textTheme.headlineSmall)
                    ],
                  ),
          );
        },
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 40),
      child: Text(
        "Por favor, presionar solo en las entradas o salidas de los horarios de la entidad",
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
