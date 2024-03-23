import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  String? userName;
  final String? email;
  final String? phoneNumber;
  final String? uid;
  final String? status;
  final String? imageProfileUrl;
  final bool? isOnline;

  UserEntity({
    this.userName,
    this.email,
    this.phoneNumber,
    this.uid,
    this.status,
    this.imageProfileUrl,
    this.isOnline,
  });

  @override
  List<Object?> get props => [
        userName,
        email,
        phoneNumber,
        uid,
        status,
        imageProfileUrl,
        isOnline,
      ];
}
