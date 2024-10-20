import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class TrackersHealthAddTemperature extends StatelessWidget {
  const TrackersHealthAddTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    final phonePadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: AppColors.e8ddf9,
      body: Column(
        children: [
          SizedBox(height: phonePadding.top + 10),

          /// #custom app bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                /// #arrow left, back text
                const CustomBackButton(),

                /// #sleep music text
                Text(
                  t.trackers.addTemperature.title,
                  style: const TextStyle(
                    
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
