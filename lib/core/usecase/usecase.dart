import 'package:dartz/dartz.dart';
import 'package:music_app/core/errors/app_error_handler.dart';

abstract class UseCase<Type, Parms> {
  Future<Either<AppErrorHandler, Type>> call(Parms parms);
}
