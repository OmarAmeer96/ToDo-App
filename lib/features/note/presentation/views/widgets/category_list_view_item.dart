import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryListViewIem extends StatelessWidget {
  const CategoryListViewIem({
    super.key,
    required this.isActive,
    required this.categoryIcon,
  });

  final bool isActive;
  final String categoryIcon;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.withOpacity(0.5),
            child: Center(
              child: SvgPicture.asset(
                categoryIcon,
                // ignore: deprecated_member_use
                color: Colors.white,
                height: 35,
                width: 35,
              ),
            ),
          )
        : CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            child: Center(
              child: SvgPicture.asset(
                categoryIcon,
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          );

    // return isActive
    //     ? CircleAvatar(
    //         radius: 20,
    //         backgroundColor: Colors.white,
    //         child: CircleAvatar(
    //           radius: 18,
    //           backgroundColor: categoryIcon,
    //         ),
    //       )
    //     : CircleAvatar(
    //         radius: 20,
    //         backgroundColor: categoryIcon,
    //       );
  }
}
