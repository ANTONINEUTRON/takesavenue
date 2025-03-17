import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takesavenue/features/takes/cubits/takes_cubit.dart';
import 'package:takesavenue/utils/routes/routes.gr.dart';
import 'package:takesavenue/features/takes/page/add_takes_page.dart';
import 'package:takesavenue/features/takes/page/takes_page.dart';
import 'package:takesavenue/features/profile/page/profile_page.dart';
import 'package:takesavenue/gen/assets.gen.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 1;

  var pages = [TakesPage(), AddBanterPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    context.read<TakesCubit>().fetchFeed(context);
    context.read<TakesCubit>().fetchUserTakes(context);
    context.read<TakesCubit>().fetchLeaderboard(context);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Assets.logo.appIconNobg.image(width: 48, height: 48),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 16, 0),
            child: SettingsButton(),
          ),
        ],
      ),
      body: IndexedStack(index: index, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap:
            (value) => setState(() {
              index = value;
            }),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        items: [
          BottomNavigationBarItem(
            icon: Assets.icons.lists.svg(
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            activeIcon: Assets.icons.lists.svg(
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.tertiary,
                BlendMode.srcIn,
              ),
            ),
            label: "Bants",
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.add.svg(
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            activeIcon: Assets.icons.add.svg(
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.tertiary,
                BlendMode.srcIn,
              ),
            ),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.profile.svg(
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            activeIcon: Assets.icons.profile.svg(
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.tertiary,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

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
