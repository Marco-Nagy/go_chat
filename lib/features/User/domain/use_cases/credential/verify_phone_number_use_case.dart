import 'package:go_chat/core/useCase/use_case.dart';
import 'package:go_chat/features/user/domain/repositories/user_repository.dart';

class VerifyPhoneNumberUseCase extends UseCase<void, String> {
  UserRepository userRepository;

  VerifyPhoneNumberUseCase({
    required this.userRepository,
  });

  @override
  Future<void> call(String phoneNumber) {
    return userRepository.verifyPhoneNumber(phoneNumber);
  }
}
