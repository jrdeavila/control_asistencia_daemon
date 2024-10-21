import 'package:control_asistencia_daemon/lib.dart';
import 'package:flutter/material.dart';

class AssistanceDetailsView extends StatelessWidget {
  final Assistance assistance;
  const AssistanceDetailsView({super.key, required this.assistance});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var image in assistance.images)
          Image.network(
            "${baseUrl}viewer?url=${image.url}",
            width: 200,
            height: 200,
          ),
      ],
    );
  }
}