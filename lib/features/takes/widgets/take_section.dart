import 'package:flutter/material.dart';
import 'package:takesavenue/features/takes/widgets/bants_grid.dart';

class TakeSection extends StatelessWidget {
  const TakeSection({super.key});
  // final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Time left and points
        Positioned(
          top: 0,
          right: 16,
          left: 16,
          child: Column(
            children: [
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Time Left Section
                  Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: 24,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '2d 14h',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),

                  // Points Section
                  Row(
                    children: [
                      Icon(
                        Icons.token,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 24,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '1,234',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
        // Your video player widget here
        Positioned(top: 56, right: 2, left: 2, child: BantsGrid()),
        // Add details card
        // Overlay controls, likes, comments etc
        Positioned(
          right: 16,
          bottom: 24,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                child: IconButton(
                  icon: const Icon(Icons.add_comment, color: Colors.white),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 8),
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                child: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.white),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 8),
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                child: IconButton(
                  icon: const Icon(Icons.share, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 70,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.transparent,
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [
              //     Colors.transparent,
              //     Colors.black.withOpacity(0.8),
              //   ],
              // ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Punishment',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  'username  username  username  username  username  username username  username  username ',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
