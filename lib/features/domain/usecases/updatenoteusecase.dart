import 'package:notesapp/features/domain/entities/note/noteentity.dart';
import 'package:notesapp/features/domain/repositories/firebaserepository.dart';

class UpdateNoteUseCase {
  final FirebaseRepository repository;

  UpdateNoteUseCase({required this.repository});

  Future<void> call(NoteEntity note) async {
    return repository.updateNote(note);
  }
}
