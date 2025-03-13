import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:takesavenue/features/banters/widgets/video_section.dart';
import 'package:takesavenue/utils/widgets/custom_button.dart';

@RoutePage()
class BantersPage extends StatelessWidget {
  const BantersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const PageScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(child: Center(child: VideoSection(index: index)));
        },
      ),
    );
  }
}
