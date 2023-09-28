import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_app_bar.dart';

import 'custom_note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomAppBar(),
            NotesItem()

          ],
        ),
      ),
    );
  }
}


