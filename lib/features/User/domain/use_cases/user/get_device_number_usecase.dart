import 'package:go_chat/core/useCase/no_param_use_case.dart';
import 'package:go_chat/features/user/domain/entities/contact_entity.dart';
import 'package:go_chat/features/user/domain/repositories/user_repository.dart';

class GetDeviceNumberUseCase extends UseCase<List<ContactEntity>> {
  final UserRepository repository;

  GetDeviceNumberUseCase({required this.repository});

  @override
  Future<List<ContactEntity>> call() async {
    return await repository.getDeviceNumber();
  }

}