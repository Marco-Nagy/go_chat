import 'package:go_chat/core/useCase/no_param_use_case.dart';
import 'package:go_chat/features/user/domain/repositories/user_repository.dart';

class GetCurrentUidUseCase extends UseCase<String> {
  UserRepository userRepository;

  GetCurrentUidUseCase.name(this.userRepository);

  @override
  Future<String> call() {
    return userRepository.getCurrentUID();
  }
}
