import 'package:notesapp/features/domain/repositories/firebaserepository.dart';
import 'package:notesapp/features/domain/entities/note/noteentity.dart';

class DeleteNoteUseCase {
  final FirebaseRepository repository;

  DeleteNoteUseCase({required this.repository});

  Future<void> call(NoteEntity note) async {
    return repository.deleteNote(note);
  }
}
