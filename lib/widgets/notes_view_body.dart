import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/widgets/custom_app_bar.dart';
import 'package:notes/widgets/notes_list_view.dart';

class MyNotesViewBody extends StatelessWidget {
  const MyNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
      return  SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:  Column(
            children: <Widget>[
              const  SizedBox(
                height: 50,
              ),
              const CustomAppBar(title: 'Notes',icon:Icons.search),
              const  SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView(
                  children: const <Widget>[

                   // NotesItem(),
                    //NotesItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}



class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {

  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    debugPrint("List Loading Done");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),

        child: Column(
          children: [
            CustomAppBar(title:'Notes',icon:Icons.search),
            SizedBox(
              height: 50,
            ),

            Expanded(child: NotesListView(),)


          ],
        ),

    ));
  }
}



