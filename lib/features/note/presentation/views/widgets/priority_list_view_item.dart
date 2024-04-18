import 'package:flutter/material.dart';

class PriorityListViewItem extends StatelessWidget {
  const PriorityListViewItem({
    super.key,
    required this.isActive,
    required this.priority,
  });

  final bool isActive;
  final int priority;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.withOpacity(0.5),
            child: Center(
              child: Text(
                priority.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato-Bold'),
              ),
            ),
          )
        : CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            child: Center(
              child: Text(
                priority.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato-Bold'),
              ),
            ),
          );
  }
}
