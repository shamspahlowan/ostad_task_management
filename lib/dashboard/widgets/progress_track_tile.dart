import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressTrackTile extends StatefulWidget {
  final String status;
  final String count;
  const ProgressTrackTile({
    super.key,
    required this.status,
    required this.count,
  });

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
          colors: [Colors.white, Colors.white],
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
            widget.count.padLeft(2, "0"),
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            widget.status,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
