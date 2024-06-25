import 'package:notesapp/features/domain/entities/note/noteentity.dart';
import 'package:notesapp/features/domain/repositories/firebaserepository.dart';

class AddNewNoteUseCase {
  final FirebaseRepository repository;

  AddNewNoteUseCase({required this.repository});

  Future<void> call(NoteEntity note) async {
    return repository.addNewNote(note);
  }
}
