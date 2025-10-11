import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostad_task_management/shared/task_manager.dart';
import 'package:ostad_task_management/shared/task_status_util.dart';

class ProgressTrackTile extends StatefulWidget {
  final TaskStatus status;
  const ProgressTrackTile({super.key, required this.status});

  @override
  State<ProgressTrackTile> createState() => _ProgressTrackTileState();
}

class _ProgressTrackTileState extends State<ProgressTrackTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: RadialGradient(
          colors: [widget.status.getColor, Colors.white],
          center: Alignment.center,
          radius: 0.85,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            blurStyle: BlurStyle.normal,
            color: const Color(0xFFCECECE),
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            TaskManager.getTaskCountByStatus(
              widget.status,
            ).toString().padLeft(2, "0"),
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            widget.status.getLabel,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
