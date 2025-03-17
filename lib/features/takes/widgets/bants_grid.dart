import 'package:flutter/material.dart';
import 'package:takesavenue/features/takes/widgets/mini_video_player.dart';
import 'package:takesavenue/utils/models/take.dart';
import 'package:takesavenue/utils/widgets/custom_button.dart';

class BantsGrid extends StatelessWidget {
  const BantsGrid({super.key,required this.take});

  final Take take;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        mainAxisExtent: MediaQuery.of(context).size.height * 0.50,
      ),
      padding: const EdgeInsets.all(2),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        // First Grid Item
        Column(
          children: [
            Expanded(child: MiniVideoPlayer(userId: take.userId,)),
            const SizedBox(height: 8),
            const CustomButton(text: "Agree"),
          ],
        ),
        // Second Grid Item
        Column(
          children: [
            Expanded(child: MiniVideoPlayer(userId: take.userId)),
            const SizedBox(height: 8),
            const CustomButton(text: "Disagree", color: Colors.blueGrey),
          ],
        ),
      ],
    );
  }
}
