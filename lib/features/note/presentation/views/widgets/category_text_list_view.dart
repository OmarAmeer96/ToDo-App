import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/note/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:todo_app/features/note/presentation/views/widgets/category_text_list_view_item.dart';
import '../../../../../constants.dart';

class CategoryTextListView extends StatefulWidget {
  const CategoryTextListView({super.key});

  @override
  State<CategoryTextListView> createState() => _CategoryTextListViewState();
}

class _CategoryTextListViewState extends State<CategoryTextListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20 * 2,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: kCategoryTexts.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  BlocProvider.of<AddNoteCubit>(context).category =
                      kCategoryTexts[index];
                  currentIndex = index;
                });
              },
              child: CategoryTextListViewIem(
                isActive: currentIndex == index,
                categoryText: kCategoryTexts[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
