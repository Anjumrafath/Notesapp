import 'package:notesapp/features/domain/entities/note/noteentity.dart';
import 'package:notesapp/features/domain/repositories/firebaserepository.dart';

class GetNotesUseCase {
  final FirebaseRepository repository;

  GetNotesUseCase({ required this.repository});

  Stream<List<NoteEntity>> call(String uid) {
    return repository.getNotes(uid);
  }
}
