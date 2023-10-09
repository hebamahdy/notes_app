import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_app_bar.dart';
import 'package:notes/widgets/notes_list_view.dart';

import 'custom_note_item.dart';


class MyNotesViewBody extends StatelessWidget {
  const MyNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              CustomAppBar(),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView(
                  children: const <Widget>[

                    NotesItem(),
                    NotesItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}



class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),

        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(
              height: 50,
            ),

            Expanded(child: NotesListView(),)


          ],
        ),

    ));
  }
}



