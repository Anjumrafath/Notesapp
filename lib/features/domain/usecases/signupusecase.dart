import 'package:notesapp/features/domain/repositories/firebaserepository.dart';
import 'package:notesapp/features/domain/entities/user/userentity.dart';

class SignUPUseCase {
  final FirebaseRepository repository;

  SignUPUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.signUp(user);
  }
}
