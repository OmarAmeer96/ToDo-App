import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/note/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:todo_app/features/note/presentation/views/widgets/category_list_view_item.dart';

import '../../../../../constants.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20 * 2,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: kCategoryIcons.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  BlocProvider.of<AddNoteCubit>(context).categoryIcon =
                      kCategoryIcons[index];
                  currentIndex = index;
                });
              },
              child: CategoryListViewIem(
                isActive: currentIndex == index,
                categoryIcon: kCategoryIcons[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
