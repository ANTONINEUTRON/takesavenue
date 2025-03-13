import 'package:flutter/material.dart';
import 'package:takesavenue/features/banters/widgets/mini_video_player.dart';
import 'package:takesavenue/utils/widgets/custom_button.dart';

class BantsGrid extends StatelessWidget {
  const BantsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        mainAxisExtent: MediaQuery.of(context).size.height * 0.55,
      ),
      padding: const EdgeInsets.all(2),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        // First Grid Item
        Column(
          children: [
            Expanded(child: MiniVideoPlayer()),
            const SizedBox(height: 8),
            const CustomButton(text: "Agree"),
          ],
        ),
        // Second Grid Item
        Column(
          children: [
            Expanded(
              child: Container(color: Colors.blueGrey, width: double.infinity),
            ),
            const SizedBox(height: 8),
            const CustomButton(text: "Disagree", color: Colors.blueGrey),
          ],
        ),
      ],
    );
  }
}
