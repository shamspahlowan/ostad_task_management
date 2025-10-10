import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostad_task_management/shared/task_status_util.dart';

class TaskTile extends StatefulWidget {
  final TaskStatus status;
  const TaskTile({super.key, required this.status});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: RadialGradient(
          colors: [widget.status.getColor, Colors.white],
          center: Alignment.centerLeft,
          radius: 4.85,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            blurStyle: BlurStyle.normal,
            color: const Color(0xFFCECECE),
            spreadRadius: 0,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Everyday push to git hub and more".toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "This is the description of the tasks. i do not know what i am writing but i hate typing"
                .toUpperCase(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 8),
          Text("Date: 12/12/12"),
          Row(
            children: [
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(18),
              //     gradient: RadialGradient(
              //       colors: [widget.status.getColor, Colors.white],
              //       center: Alignment.bottomLeft,
              //       radius: 5,
              //     ),
              //     boxShadow: [
              //       BoxShadow(
              //         blurRadius: 2,
              //         blurStyle: BlurStyle.normal,
              //         color: const Color.fromARGB(255, 255, 255, 255),
              //         spreadRadius: 0,
              //         offset: Offset(0, 0),
              //       ),
              //     ],
              //   ),
              //   child: Text("data"),
              // ),
              Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit_note_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete_forever_sharp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
