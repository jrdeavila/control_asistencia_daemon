import 'package:control_asistencia_daemon/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [
        const SizedBox(
          height: 150,
          width: double.infinity,
          child: Center(
            child: SizedBox(width: 150, child: CameraView()),
          ),
        ),
        _buildTitle(context),
        _buildCustomCardButton(
          context,
          "Marcar asistencia",
          Icons.camera_alt,
          () {
            BlocProvider.of<DashboardBloc>(context).add(
              DashboardTakeAssistanceRequested(),
            );
          },
        ),
        _buildCustomCardButton(
          context,
          "Historial de asistencias",
          Icons.history,
          () {
            BlocProvider.of<DashboardBloc>(context).add(
              DashboardShowAssistanceHistoryRequested(),
            );
          },
        ),
        _buildCustomCardButton(
          context,
          "Estadísticas",
          Icons.bar_chart,
          () {
            BlocProvider.of<DashboardBloc>(context)
                .add(DashboardShowStatisticsRequested());
          },
        ),
        _buildLogoutButton(context),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: 300,
      child: CustomCardButton(
        onPressed: () {
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthenticationLogoutRequested());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.logout,
                size: 30, color: Theme.of(context).colorScheme.onPrimary),
            const SizedBox(width: 10),
            Text("Terminar jornada",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      width: 600,
      child: Text(
        "Bienvenido funcionario, por favor seleccione una opción.",
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildCustomCardButton(BuildContext context, String title,
      IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 200,
      child: CustomCardButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon,
                  size: 30, color: Theme.of(context).colorScheme.onPrimary),
              const SizedBox(width: 10),
              Text(title, style: Theme.of(context).textTheme.bodyMedium),
            ],
          )),
    );
  }
}
