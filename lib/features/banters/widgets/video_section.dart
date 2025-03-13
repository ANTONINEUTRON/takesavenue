import 'package:flutter/material.dart';
import 'package:takesavenue/features/banters/widgets/bants_grid.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Your video player widget here
        Positioned(top: 16, right: 2, left: 2, child: BantsGrid()),
        // Add draggable details card
        DraggableScrollableSheet(
          initialChildSize: 0.1,
          minChildSize: 0.1,
          maxChildSize: 0.2,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                // borderRadius: const BorderRadius.vertical(
                //   top: Radius.circular(20),
                // ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Drag handle
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    // Content
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 48, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Repercussion',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Description for video $index. Add your content here. got ot thdnsn ds',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        // Overlay controls, likes, comments etc
        Positioned(
          right: 16,
          bottom: 80,
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
      ],
    );
  }
}
