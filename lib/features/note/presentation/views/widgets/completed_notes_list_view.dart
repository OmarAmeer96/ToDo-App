import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/note/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:todo_app/features/note/data/models/note_model.dart';
import 'package:todo_app/features/note/presentation/views/widgets/completed_notes_empty_widget.dart';
import 'package:todo_app/features/note/presentation/views/widgets/note_item.dart';

class CmpletedNotesListView extends StatelessWidget {
  const CmpletedNotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        List<NoteModel> completedNotes = [];
        for (var note in notes) {
          if (note.completed == true) {
            completedNotes.add(note);
          }
        }
        // Will not be bull
        // Because the initState will be called bsfore he widget to be built.
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: completedNotes.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.all(0),
                  physics: const BouncingScrollPhysics(),
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return notes[index].completed == true
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: NoteItem(
                              note: notes[index],
                            ),
                          )
                        : const SizedBox.shrink();
                  },
                )
              : const Center(
                  child: CompletedNotesEmptyWidget(),
                ),
        );
      },
    );
  }
}
