import 'package:go_chat/core/useCase/use_case.dart';
import 'package:go_chat/features/user/domain/entities/user_entity.dart';
import 'package:go_chat/features/user/domain/repositories/user_repository.dart';

class UpdateUserUseCase extends UseCase<void,UserEntity>{
  final UserRepository repository;

  UpdateUserUseCase({required this.repository});

  @override
  Future<void> call(UserEntity user) async {
    return repository.updateUser(user);
  }

}