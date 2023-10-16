import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/notes_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  bool isLoading=true;

  addNote(NoteModel noteModel) async
  {
    emit(AddNoteLoading());
    try {
      var noteBox=Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(noteModel);
      isLoading=false;
      emit(AddNoteSuccess());
    } catch (e) {
      isLoading=false;
      AddNoteFailure(e.toString());
    }

  }
}
