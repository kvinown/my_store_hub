import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/domain/entity/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getCurrentUser();
  Future<Either<Failure, String>> updateCurrentUser(User user, XFile? image);
}
