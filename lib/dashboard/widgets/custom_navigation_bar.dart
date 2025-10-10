import 'package:flutter/material.dart';
import 'package:ostad_task_management/dashboard/widgets/navbar_tile.dart';

class CustomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final int viewCount;
  final ValueChanged<int> onSelected;
  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onSelected,
    required this.viewCount,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            blurStyle: BlurStyle.outer,
            color: Colors.grey,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavbarTile(
            index: 0,
            icon: Icon(Icons.note_add_outlined),
            label: "New Task",
            isActive: widget.currentIndex == 0,
            ontap: () => widget.onSelected(0),
          ),
          NavbarTile(
            index: 1,
            icon: Icon(Icons.restore_page_outlined),
            label: "Progress",
            isActive: widget.currentIndex == 1,
            ontap: () => widget.onSelected(1),
          ),
          NavbarTile(
            index: 2,
            icon: Icon(Icons.done_rounded),
            label: "Completed",
            isActive: widget.currentIndex == 2,
            ontap: () => widget.onSelected(2),
          ),
          NavbarTile(
            index: 3,
            icon: Icon(Icons.playlist_remove_outlined),
            label: "Cancelled",
            isActive: widget.currentIndex == 3,
            ontap: () => widget.onSelected(3),
          ),
        ],
      ),
    );
  }
}
