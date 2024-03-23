import 'package:go_chat/core/useCase/use_case.dart';
import 'package:go_chat/features/user/domain/repositories/user_repository.dart';

class SignInWithPhoneNumberUseCase extends UseCase<void,String>{
  UserRepository userRepository;

  SignInWithPhoneNumberUseCase({
    required this.userRepository,
  });

  @override
  Future<void> call( String smsPinCode) {
    return userRepository.signInWithPhoneNumber(smsPinCode);
  }




}
