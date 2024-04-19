import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/features/note/data/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  bool isLoading = false;
  bool get isCurrentlyLoading => isLoading;
  Color color = const Color(0xff2191FB);
  String categoryIcon = "assets/svg/design.svg";
  int priority = 1;
  String category = "Design";
  bool isCompleted = false;
  // Method to add notes in the HIVE database
  addNote(NoteModel note) async {
    note.color = color.value;
    note.categoryIcon = categoryIcon;
    note.priority = priority;
    note.category = category;
    note.completed = isCompleted;
    isLoading = true;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccess("Note successfully added"));
      isLoading = false;
    } catch (e) {
      emit(AddNoteFailure("Error: $e"));
      isLoading = false;
    }
  }
}
