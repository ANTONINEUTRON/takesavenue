

import 'package:flutter/material.dart';
import 'package:takesavenue/utils/functions/format_created_at.dart';
import 'package:takesavenue/utils/models/take.dart';

class ProfileTakeItem extends StatelessWidget {
  const ProfileTakeItem({super.key, required this.take});

  final Take take;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.history)),
      title: Text(take.title),
      subtitle: Text(formatCreatedAt(take.createdAt)),
    );
  }
}
