import 'package:go_chat/core/useCase/no_param_use_case.dart';
import 'package:go_chat/features/user/domain/repositories/user_repository.dart';

class IsSignInUseCase extends UseCase<bool> {
  UserRepository userRepository;

  IsSignInUseCase.name(this.userRepository);

  @override
  Future<bool> call() {
    return userRepository.isSignIn();
  }
}
