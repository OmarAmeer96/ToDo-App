import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/note/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:todo_app/features/note/data/models/note_model.dart';
import 'package:todo_app/features/note/presentation/views/widgets/note_item.dart';

class NotCmpletedNotesListView extends StatelessWidget {
  const NotCmpletedNotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        // Will not be bull
        // Because the initState will be called bsfore he widget to be built.
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            physics: const BouncingScrollPhysics(),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return notes[index].completed == false
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: NoteItem(
                        note: notes[index],
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}
