import 'package:auto_route/auto_route.dart';
import 'package:avatar_plus/avatar_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takesavenue/features/auth/cubits/auth_cubits.dart';
import 'package:takesavenue/utils/models/user.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    User user = context.watch<AuthCubits>().state.user!;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // Profile Header
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: user.profilePicture!.isEmpty ? null : NetworkImage(user.profilePicture!),
                      child: user.profilePicture!.isEmpty ? AvatarPlus(user.username) : null,
                    ),
                    const SizedBox(height: 16),
                     Text(
                      user.username,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     Text(
                      user.email,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      formatWallet(user.keypair ?? ""),
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              // Wallet Card
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.purple, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          'Credits',
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          user.credits.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Show fund wallet bottom sheet
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.purple,
                      ),
                      child: const Text('Fund Wallet'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Tabs
              const TabBar(
                tabs: [
                  Tab(text: 'Takes'),
                  Tab(text: 'Favorites'),
                  Tab(text: 'Leaderboard'),
                ],
              ),

              // Tab Views
              Expanded(
                child: TabBarView(
                  children: [
                    // Activities Tab
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.history),
                          ),
                          title: Text('Activity ${index + 1}'),
                          subtitle: Text('Description for activity ${index + 1}'),
                        );
                      },
                    ),

                    // Favorites Tab
                    ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.favorite),
                          ),
                          title: Text('Favorite ${index + 1}'),
                          subtitle: Text('Description for favorite ${index + 1}'),
                        );
                      },
                    ),

                    // Leaderboard Tab
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text('User ${index + 1}'),
                          trailing: Text('${1000 - (index * 100)} pts'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  String formatWallet(String keypair) {
    if(keypair.isEmpty) return "";

    return keypair.substring(0, 5) + "..." + keypair.substring(keypair.length - 5);
  }
}
