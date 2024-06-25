import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:notesapp/features/domain/entities/user/userentity.dart';
import 'package:notesapp/features/domain/usecases/getcreatecurrentuserusecase.dart';
import 'package:notesapp/features/domain/usecases/signinusecase.dart';
import 'package:notesapp/features/domain/usecases/signupusecase.dart';
import 'package:notesapp/features/presentation/cubit/user/userstate.dart';

class UserCubit extends Cubit<UserState> {
  final SignInUseCase signInUseCase;
  final SignUPUseCase signUPUseCase;
  final GetCreateCurrentUserUsecase getCreateCurrentUserUseCase;
  UserCubit(
      {required this.signUPUseCase,
      required this.signInUseCase,
      required this.getCreateCurrentUserUseCase})
      : super(UserInitial());

  Future<void> submitSignIn({required UserEntity user}) async {
    emit(UserLoading());
    try {
      await signInUseCase.call(user);
      emit(UserSuccess());
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }

  Future<void> submitSignUp({required UserEntity user}) async {
    emit(UserLoading());
    try {
      await signUPUseCase.call(user);
      await getCreateCurrentUserUseCase.call(user);
      emit(UserSuccess());
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }
}
