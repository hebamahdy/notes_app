import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/notes_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> ? notes;
  /*fetchAllNotes() async
  {
    emit(NotesInitial());
    try {
      var noteBox=Hive.box<NoteModel>(kNotesBox);
       notes=noteBox.values.toList();
      print("notes.length ${notes.length}");
      emit(NotesSuccess(notes));
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }

  }*/

fetchAllNotes() async
  {

      var noteBox=Hive.box<NoteModel>(kNotesBox);
      notes =noteBox.values.toList();
      print("notes.length ${notes!.length}");
      emit(NotesSuccess());
  }

}
