

import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class ContactEntity  {
    final String? label;
    final String? phoneNumber;
    final String? uid;
    final String? status;
    final Uint8List? userImageProfileUrl;

    const ContactEntity({
    this.label,
    this.phoneNumber,
    this.uid,
    this.status,
    this.userImageProfileUrl,
  });
}
