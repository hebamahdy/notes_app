import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/notes_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  fetchAllNotes() async
  {
    emit(NotesLoading());
    try {
      var noteBox=Hive.box<NoteModel>(kNotesBox);
      //List<NoteModel> notes=noteBox.values.toList();
      emit(NotesSuccess(noteBox.values.toList()));
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }

  }

}
