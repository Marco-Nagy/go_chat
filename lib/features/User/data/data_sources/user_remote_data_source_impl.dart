import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_chat/core/utils/firebase_collection_const.dart';
import 'package:go_chat/core/utils/message_type_const.dart';
import 'package:go_chat/core/widgets/snack_bar.dart';
import 'package:go_chat/core/widgets/toast.dart';
import 'package:go_chat/features/user/data/data_sources/use_remote_data_source.dart';
import 'package:go_chat/features/user/data/models/contact_model.dart';
import 'package:go_chat/features/user/data/models/user_model.dart';
import 'package:go_chat/features/user/domain/entities/contact_entity.dart';
import 'package:go_chat/features/user/domain/entities/user_entity.dart';

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final FirebaseFirestore fireStore;
  final FirebaseAuth firebaseAuth;

  String _verificationId = '';

  UserRemoteDataSourceImpl({
    required this.fireStore,
    required this.firebaseAuth,
  });

  @override
  Future<void> createUser(UserEntity user) async {
    final userCollection = fireStore.collection(FirebaseCollectionConst.users);
    final uid = await getCurrentUID();
    final newUser = UserModel(
      uid: user.uid,
      userName: user.userName,
      email: user.email,
      imageProfileUrl: user.imageProfileUrl,
      isOnline: user.isOnline,
      phoneNumber: user.phoneNumber,
      status: user.status,
    ).toDocument();
    try {
      userCollection.doc(uid).get().then((userDoc) {
        if (!userDoc.exists) {
          userCollection.doc(uid).set(newUser);
        } else {
          userCollection.doc(uid).update(newUser);
        }
      });
    } catch (e) {
      throw Exception('Error while creating user');
    }
  }

  @override
  Stream<List<UserEntity>> getAllUsers() {
    final userCollection = fireStore.collection(FirebaseCollectionConst.users);
    return userCollection.snapshots().map((querySnapShot) =>
        querySnapShot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Future<String> getCurrentUID() async {
    return firebaseAuth.currentUser!.uid;
  }

  @override
  Future<List<ContactEntity>> getDeviceNumber() async {
    final getContactsData = await ContactsService.getContacts();
    List<ContactEntity> contacts = [];
    for (var myContact in getContactsData) {
      for (var phone in myContact.phones!) {
        contacts.add(ContactEntity(
          phoneNumber: phone.value,
          label: myContact.displayName,
          userImageProfileUrl: myContact.avatar,
        ));
      }
    }
    return contacts;
  }

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) {
    final userCollection = fireStore
        .collection(FirebaseCollectionConst.users)
        .where('uid', isEqualTo: uid);
    return userCollection.snapshots().map((querySnapShot) =>
        querySnapShot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Future<bool> isSignIn() async {
    return firebaseAuth.currentUser?.uid != null;
  }

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) async {
try{
  final AuthCredential credential  = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: smsPinCode);
  await firebaseAuth.signInWithCredential(credential);
} on FirebaseAuthException catch(e){
  if(e.code == 'invalid-verification-code') {
    ToastNotification().error( 'invalid verification code');

  }else if(e.code == 'quota-exceeded'){
    ToastNotification().error( 'sms quota-exceeded');
  }
}catch(e){
  ToastNotification().error('unKnown Exeption Please Try again');
}
  }
  @override
  Future<void> signOut() async {
    return firebaseAuth.signOut();
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    final userCollection = fireStore.collection(FirebaseCollectionConst.users);
    Map<String, dynamic> userInfo = {};
    if (user.userName != "" && user.userName != null) {
      userInfo['userName'] = user.userName;
    }
    if (user.imageProfileUrl != "" && user.imageProfileUrl != null) {
      userInfo['imageProfileUrl'] = user.imageProfileUrl;
    }
    if (user.isOnline != null) userInfo['isOnline'] = user.isOnline;
    userCollection.doc(user.uid).update(userInfo);
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      timeout: const Duration(seconds: 60),
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential phoneAuthCredential) {
    ToastNotification().success('verificationCompleted');
  }

  void verificationFailed(FirebaseAuthException error) {
    ToastNotification().error('verificationFailed');
    if (error.code == 'invalid-phone-number') {
      ToastNotification().error('The provided phone number is not valid.');
    }
    else {
      ToastNotification().error('Some error occurred: $error');
    }
  }

  void codeSent(String verificationId, int? forceResendingToken) {
    _verificationId = verificationId;
    ToastNotification().success('codeSent');
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    _verificationId = verificationId;
    ToastNotification().error("Timeout: $verificationId");
  }
}
