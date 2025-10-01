import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostad_task_management/util/asset_paths.dart';

class Background extends StatelessWidget {
  final Widget? child;
  const Background({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SvgPicture.asset(AssetPaths.background, fit: BoxFit.cover),
        ),
        Center(child: child ?? SizedBox.shrink()),
      ],
    );
  }
}
