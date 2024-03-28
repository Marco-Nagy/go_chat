import 'package:go_chat/features/user/data/data_sources/use_remote_data_source.dart';
import 'package:go_chat/features/user/domain/entities/contact_entity.dart';
import 'package:go_chat/features/user/domain/entities/user_entity.dart';
import 'package:go_chat/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository{
   final UserRemoteDataSource userRemoteDataSource;
    UserRepositoryImpl({
       required this.userRemoteDataSource,
   });
  @override
  Future<void> createUser(UserEntity user) {
    return userRemoteDataSource.createUser(user);
  }

  @override
  Stream<List<UserEntity>> getAllUsers() {
      return userRemoteDataSource.getAllUsers();
  }

  @override
  Future<String> getCurrentUID() {
      return userRemoteDataSource.getCurrentUID();
  }

  @override
  Future<List<ContactEntity>> getDeviceNumber() {
      return userRemoteDataSource.getDeviceNumber();
  }

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) {
      return userRemoteDataSource.getSingleUser(uid);
  }

  @override
  Future<bool> isSignIn() {
    return userRemoteDataSource.isSignIn();
  }

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) {
    return userRemoteDataSource.signInWithPhoneNumber(smsPinCode);
  }

  @override
  Future<void> signOut() {
    return userRemoteDataSource.signOut();
  }

  @override
  Future<void> updateUser(UserEntity user) {
    return userRemoteDataSource.updateUser(user);
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) {
    return userRemoteDataSource.verifyPhoneNumber(phoneNumber);
  }


}
