import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/note/data/models/note_model.dart';
import 'package:todo_app/features/note/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:todo_app/features/note/presentation/views/widgets/category_list_view_item.dart';

import '../../../../../constants.dart';

class EditNoteCategoriesListView extends StatefulWidget {
  const EditNoteCategoriesListView({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteCategoriesListView> createState() =>
      _EditNoteCategoriesListViewState();
}

class _EditNoteCategoriesListViewState
    extends State<EditNoteCategoriesListView> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kCategoryIcons.indexOf(widget.note.categoryIcon);
    super.initState();
  }

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
