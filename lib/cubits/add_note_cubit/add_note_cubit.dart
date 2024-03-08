import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = kYellow;

  addNote(NoteModel noteModel) async {
    noteModel.color = color.value;
    emit(AddNoteLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      emit(AddNoteSuccess());
      await notesBox.add(noteModel);
    } on Exception catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
