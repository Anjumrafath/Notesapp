import 'package:notesapp/features/domain/repositories/firebaserepository.dart';

class GetCurrentUidUseCase {
  final FirebaseRepository repository;

  GetCurrentUidUseCase({required this.repository});

  Future<String> call() async {
    return repository.getCurrentUId();
  }
}
