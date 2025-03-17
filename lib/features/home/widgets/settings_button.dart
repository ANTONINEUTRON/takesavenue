

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:takesavenue/utils/routes/routes.gr.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: IconButton(
        icon: Icon(Icons.settings),
        onPressed: () => context.router.push(SettingsRoute()),
      ),
    );
  }
}
