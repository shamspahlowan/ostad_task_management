import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarTile extends StatefulWidget {
  final int index;
  final bool isActive;
  final VoidCallback? ontap;
  final Icon icon;
  final String label;
  const NavbarTile({
    super.key,
    required this.index,
    required this.isActive,
    this.ontap,
    required this.icon,
    required this.label,
  });

  @override
  State<NavbarTile> createState() => _NavbarTileState();
}

class _NavbarTileState extends State<NavbarTile> {
  Color getColor() {
    if (widget.isActive) {
      return const Color(0xFF09DB76);
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: getColor(),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            if (widget.isActive)
              BoxShadow(
                blurRadius: 4,
                blurStyle: BlurStyle.outer,
                color: Colors.grey,
                spreadRadius: 0,
                offset: Offset(0, 0),
              ),
          ],
        ),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 500),
          child: Row(
            spacing: 5,
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.icon,
              if (widget.isActive)
                Text(
                  widget.label,
                  style: GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
