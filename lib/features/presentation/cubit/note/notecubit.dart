import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:notesapp/features/domain/entities/note/noteentity.dart';
import 'package:notesapp/features/domain/usecases/addnewnoteusecase.dart';
import 'package:notesapp/features/domain/usecases/deletenoteusecase.dart';
import 'package:notesapp/features/domain/usecases/getnotesusecase.dart';
import 'package:notesapp/features/domain/usecases/updatenoteusecase.dart';
import 'package:notesapp/features/presentation/cubit/note/notestate.dart';

class NoteCubit extends Cubit<NoteState> {
  final UpdateNoteUseCase updateNoteUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;
  final GetNotesUseCase getNotesUseCase;
  final AddNewNoteUseCase addNewNoteUseCase;
  NoteCubit(
      {required this.getNotesUseCase,
      required this.deleteNoteUseCase,
      required this.updateNoteUseCase,
      required this.addNewNoteUseCase})
      : super(NoteInitial());

  Future<void> addNote({required NoteEntity note}) async {
    try {
      await addNewNoteUseCase.call(note);
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch (_) {
      emit(NoteFailure());
    }
  }

  Future<void> deleteNote({required NoteEntity note}) async {
    try {
      await deleteNoteUseCase.call(note);
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch (_) {
      emit(NoteFailure());
    }
  }

  Future<void> updateNote({required NoteEntity note}) async {
    try {
      await updateNoteUseCase.call(note);
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch (_) {
      emit(NoteFailure());
    }
  }

  Future<void> getNotes({required String uid}) async {
    emit(NoteLoading());
    // try {
    //   getNotesUseCase.call(uid).listen((notes) {
    //     emit(NoteLoaded(notes: notes));
    //   });
    // } on SocketException catch (_) {
    //   emit(NoteFailure());
    // } catch (_) {
    //   emit(NoteFailure());
    // }
    try {
      getNotesUseCase.call(uid).listen((notes) {
        print('Notes fetched: ${notes.length}'); // Debug log
        emit(NoteLoaded(notes: notes));
      });
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch (e) {
      print('Error fetching notes: $e'); // Debug log
      emit(NoteFailure());
    }

  }
}
