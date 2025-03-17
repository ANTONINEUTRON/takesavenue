import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:takesavenue/features/takes/widgets/take_section.dart';

@RoutePage()
class TakesPage extends StatelessWidget {
  const TakesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const PageScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(child: Center(child: TakeSection()));
        },
      ),
    );
  }
}
