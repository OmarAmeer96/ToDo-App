import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/note/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:todo_app/features/note/presentation/views/widgets/priority_list_view_item.dart';

import '../../../../../constants.dart';

class PrioritiesListView extends StatefulWidget {
  const PrioritiesListView({super.key});

  @override
  State<PrioritiesListView> createState() => _PrioritiesListViewState();
}

class _PrioritiesListViewState extends State<PrioritiesListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20 * 2,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: kPriorities.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  BlocProvider.of<AddNoteCubit>(context).priority =
                      kPriorities[index];
                  currentIndex = index;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PriorityListViewItem(
                    isActive: currentIndex == index,
                    priority: kPriorities[index],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
