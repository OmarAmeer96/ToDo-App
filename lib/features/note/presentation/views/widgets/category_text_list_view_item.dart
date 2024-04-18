import 'package:flutter/material.dart';

class CategoryTextListViewIem extends StatelessWidget {
  const CategoryTextListViewIem({
    super.key,
    required this.isActive,
    required this.categoryText,
  });

  final bool isActive;
  final String categoryText;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? AnimatedContainer(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.5),
            ),
            duration: const Duration(milliseconds: 200),
            child: Center(
              child: Text(
                categoryText,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato-Regular'),
              ),
            ),
          )
        : AnimatedContainer(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
            ),
            duration: const Duration(milliseconds: 200),
            child: Center(
              child: Text(
                categoryText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato-Regular',
                ),
              ),
            ),
          );
  }
}
