import 'package:go_chat/core/useCase/no_param_use_case.dart';
import 'package:go_chat/features/user/domain/repositories/user_repository.dart';

class SignOutUseCase extends UseCase<void> {
  UserRepository userRepository;

  SignOutUseCase({
    required this.userRepository,
  });

  @override
  Future<void> call() {
    return userRepository.signOut();
  }
}
