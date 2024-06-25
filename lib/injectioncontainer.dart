import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:notesapp/features/data/datasources/remotedatasource.dart';
import 'package:notesapp/features/data/datasources/remotedatasourceimpli.dart';
import 'package:notesapp/features/data/repositories/firebaserepositoryimpli.dart';
import 'package:notesapp/features/domain/repositories/firebaserepository.dart';
import 'package:notesapp/features/domain/usecases/addnewnoteusecase.dart';
import 'package:notesapp/features/domain/usecases/deletenoteusecase.dart';
import 'package:notesapp/features/domain/usecases/getcreatecurrentuserusecase.dart';
import 'package:notesapp/features/domain/usecases/getcurrentuidusecase.dart';
import 'package:notesapp/features/domain/usecases/getnotesusecase.dart';
import 'package:notesapp/features/domain/usecases/issigninusecase.dart';
import 'package:notesapp/features/domain/usecases/signinusecase.dart';
import 'package:notesapp/features/domain/usecases/signoutusecase.dart';
import 'package:notesapp/features/domain/usecases/signupusecase.dart';
import 'package:notesapp/features/domain/usecases/updatenoteusecase.dart';
import 'package:notesapp/features/presentation/cubit/auth/authcubit.dart';
import 'package:notesapp/features/presentation/cubit/note/notecubit.dart';
import 'package:notesapp/features/presentation/cubit/user/usercubit.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //Cubit/Bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      isSignInUseCase: sl.call(),
      signOutUseCase: sl.call(),
      getCurrentUidUseCase: sl.call()));
  sl.registerFactory<UserCubit>(() => UserCubit(
        getCreateCurrentUserUseCase: sl.call(),
        signInUseCase: sl.call(),
        signUPUseCase: sl.call(),
      ));
  sl.registerFactory<NoteCubit>(() => NoteCubit(
        updateNoteUseCase: sl.call(),
        getNotesUseCase: sl.call(),
        deleteNoteUseCase: sl.call(),
        addNewNoteUseCase: sl.call(),
      ));

  //useCase
  sl.registerLazySingleton<AddNewNoteUseCase>(
      () => AddNewNoteUseCase(repository: sl.call()));
  sl.registerLazySingleton<DeleteNoteUseCase>(
      () => DeleteNoteUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCreateCurrentUserUsecase>(
      () => GetCreateCurrentUserUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetNotesUseCase>(
      () => GetNotesUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUPUseCase>(
      () => SignUPUseCase(repository: sl.call()));
  sl.registerLazySingleton<UpdateNoteUseCase>(
      () => UpdateNoteUseCase(repository: sl.call()));

  //repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));

  //data source
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(auth: sl.call(), firestore: sl.call()));

  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}
