import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/data/datasources/user_remote_data_source.dart';
import 'package:my_store_hub/data/models/user_model.dart';
import 'package:my_store_hub/domain/entity/user.dart';
import 'package:my_store_hub/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final result = await remoteDataSource.getCurrentUser();
      return Right(result.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateCurrentUser(
    User user,
    XFile? image,
  ) async {
    try {
      await remoteDataSource.updateCurrentUser(
        UserModel.fromEntity(user),
        image,
      );
      return const Right('Berhasil update profile');
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
