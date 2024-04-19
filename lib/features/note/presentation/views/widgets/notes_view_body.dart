import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/note/presentation/views/widgets/completed_notes_list_view.dart';
import 'package:todo_app/features/note/presentation/views/widgets/not_completed_notes_list_view.dart';
import '../../manager/notes_cubit/notes_cubit.dart';
import 'custom_app_bar.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
      child: Column(
        children: [
          CustomAppBar(
            onPressed: () {},
            icon: Icons.filter_list,
            title: "Your To Do List",
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Not Completed'),
              Tab(text: 'Completed'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                NotCmpletedNotesListView(),
                CmpletedNotesListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
