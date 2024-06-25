import 'package:notesapp/features/domain/entities/user/userentity.dart';
import 'package:notesapp/features/domain/repositories/firebaserepository.dart';

class GetCreateCurrentUserUsecase {
  final FirebaseRepository repository;

  GetCreateCurrentUserUsecase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.getCreateCurrentUser(user);
  }
}
