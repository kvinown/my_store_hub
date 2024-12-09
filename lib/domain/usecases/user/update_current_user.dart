import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/domain/entity/user.dart';
import 'package:my_store_hub/domain/repositories/user_repository.dart';

class UpdateCurrentUser {
  final UserRepository repository;

  UpdateCurrentUser(this.repository);

  Future<Either<Failure, String>> execute(User user, XFile? image) {
    return repository.updateCurrentUser(user, image);
  }
}
