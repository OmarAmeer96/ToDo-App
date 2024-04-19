import 'package:flutter/material.dart';

class NoNotesWidget extends StatelessWidget {
  const NoNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/emptyNotes.png",
          height: 300,
        ),
        Text(
          "What do you want to do today?",
          style: TextStyle(
            color: Colors.white.withOpacity(0.8700000047683716),
            fontSize: 20,
            fontFamily: 'Lato-Bold',
          ),
        ),
        Text(
          "Tap + to add your tasks",
          style: TextStyle(
            color: Colors.white.withOpacity(0.8700000047683716),
            fontSize: 16,
            fontFamily: 'Lato-Regular',
          ),
        )
      ],
    );
  }
}
