import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:go_chat/core/utils/message_type_const.dart';

aweSnackBar(
    {required String msg,  String? title, required BuildContext context, required String type}) {
  final snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title!,
      message: msg,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType:  getMsgType( type  ),
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
bannerSnackBar(String msg,String title, BuildContext context,String type) {
  final materialBanner = MaterialBanner(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    backgroundColor: Colors.transparent,
    forceActionsBelow: true,
    content: AwesomeSnackbarContent(
      title: title,
      message:
     msg,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: getMsgType( type  )
        ,
      // to configure for material banner
      inMaterialBanner: true,
    ),
    actions: const [SizedBox.shrink()],
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentMaterialBanner()
    ..showMaterialBanner(materialBanner);
}
 getMsgType(String type){
  switch(type) {
    case MessageTypeConst.failure :
      return ContentType.failure;
      case MessageTypeConst.help :
      return ContentType.help;
      case MessageTypeConst.warning :
      return ContentType.warning;
      case MessageTypeConst.success :
      return ContentType.success;
    default:ContentType.success;
  }

}