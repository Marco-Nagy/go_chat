import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_chat/core/theme/styes.dart';

toast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: tabColor,
    fontSize: 16,
    gravity: ToastGravity.BOTTOM,
    textColor: whiteColor,
    timeInSecForIosWeb: 2,
    toastLength: Toast.LENGTH_SHORT,
    webPosition: ToastGravity.BOTTOM_RIGHT,
  );
}
