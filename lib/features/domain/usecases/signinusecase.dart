import 'package:notesapp/features/domain/repositories/firebaserepository.dart';
import 'package:notesapp/features/domain/entities/user/userentity.dart';

class SignInUseCase {
  final FirebaseRepository repository;

  SignInUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.signIn(user);
  }
}
