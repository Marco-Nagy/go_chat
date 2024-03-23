import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_chat/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  @override
  String? userName;
  @override
   String? email;
  @override
   String? phoneNumber;
  @override
   String? uid;
  @override
   String? status;
  @override
   String? imageProfileUrl;
  @override
   bool? isOnline;

  UserModel({
    this.userName,
    this.email,
    this.phoneNumber,
    this.uid,
    this.status,
    this.imageProfileUrl,
    this.isOnline,
  }) : super(
          userName: userName,
          email: email,
          phoneNumber: phoneNumber,
          uid: uid,
          status: status,
          imageProfileUrl: imageProfileUrl,
          isOnline: isOnline,
        );

  Map<String, dynamic> toDocument() {
    return {
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'uid': uid,
      'status': status,
      'imageProfileUrl': imageProfileUrl,
      'isOnline': isOnline,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final snap = snapshot.data() as Map<String, dynamic> ;
    return UserModel(
      userName: snap['userName'] as String,
      email: snap['email'] as String,
      phoneNumber: snap['phoneNumber'] as String,
      uid: snap['uid'] as String,
      status: snap['status'] as String,
      imageProfileUrl: snap['imageProfileUrl'] as String,
      isOnline: snap['isOnline'] as bool,
    );
  }
}
