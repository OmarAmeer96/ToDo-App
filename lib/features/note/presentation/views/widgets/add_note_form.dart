import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/note/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:todo_app/features/note/data/models/note_model.dart';
import 'package:todo_app/features/note/presentation/views/widgets/categories_list_view.dart';
import 'package:todo_app/features/note/presentation/views/widgets/category_text_list_view.dart';
import 'package:todo_app/features/note/presentation/views/widgets/priorities_list_view.dart';
import 'colors_list_view.dart';
import 'custom_main_button.dart';
import 'custom_text_field.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          // CustomTextField(
          //   onSaved: (value) {
          //     title = value;
          //   },
          //   hintText: "Title",
          // ),
          // const SizedBox(
          //   height: 24,
          // ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hintText: "Content",
            maxLines: 6,
          ),
          const SizedBox(
            height: 20,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 15,
          ),
          const CategoriesListView(),
          const SizedBox(
            height: 15,
          ),
          const CategoryTextListView(),
          const SizedBox(
            height: 15,
          ),
          const PrioritiesListView(),
          const SizedBox(
            height: 20,
          ),
          CustomMainButton(
            text: "Add Note",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var noteModel = NoteModel(
                  completed: false,
                  category: 'Design',
                  categoryIcon: 'assets/svg/design.svg',
                  priority: 1,
                  title: 'Title',
                  subTitle: subTitle!,
                  date: DateFormat('MM/dd hh:mm a').format(DateTime.now()),
                  color: Colors.deepOrange.value,
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 100),
          //   child: CustomMainButton(
          //     text: "Cancel",
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     color: const Color(0xff8D070F),
          //     height: 45,
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
