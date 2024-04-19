import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/note/data/models/note_model.dart';
import 'package:todo_app/features/note/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:todo_app/features/note/presentation/views/widgets/category_text_list_view_item.dart';
import '../../../../../constants.dart';

class EditNoteCategoryTextListView extends StatefulWidget {
  const EditNoteCategoryTextListView({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteCategoryTextListView> createState() => _EditNoteCategoryTextListViewState();
}

class _EditNoteCategoryTextListViewState extends State<EditNoteCategoryTextListView> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kCategoryTexts.indexOf(widget.note.category);
    super.initState();
  }

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
