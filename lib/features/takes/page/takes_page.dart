import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takesavenue/features/takes/cubits/takes_cubit.dart';
import 'package:takesavenue/features/takes/widgets/take_section.dart';

@RoutePage()
class TakesPage extends StatelessWidget {
  const TakesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var takesFeed = context.watch<TakesCubit>().state.takesFeed;
    
    return Scaffold(
      body: PageView.builder(
        itemCount: takesFeed.length,
        scrollDirection: Axis.vertical,
        physics: const PageScrollPhysics(),
        itemBuilder: (context, index) {
          var take = takesFeed[index];
          return Center(child: TakeSection(take: take));
        },
      ),
    );
  }
}
