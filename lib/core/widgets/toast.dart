import 'package:flutter/material.dart';
import 'package:go_chat/core/theme/styes.dart';
import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';
enum ToastType {
  info,
  error,
  success,
  warn,
}

class ToastsColorProps {
  final Color textColor;
  final Color backgroundColor;

  ToastsColorProps(this.textColor, this.backgroundColor);
}

class ToastNotification {
  /// Return text and background color for toasts type
  ToastsColorProps _getToastColor(ToastType type) {
    if (type == ToastType.success) {
      return ToastsColorProps(
        successTextColor,
        successBgColor,
      );
    } else if (type == ToastType.error) {
      return ToastsColorProps(errorTextColor, errorBgColor);
    } else if (type == ToastType.warn) {
      return ToastsColorProps(warnTextColor, warnBgColor);
    } else {
      return ToastsColorProps(infoTextColor, infoBgColor);
    }
  }

  /// Display the toast on the overlay
   _showToast(ToastType type, String content, IconData icon) {
    return    showToastWidget(
      _buildToast(type, content, icon),
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(seconds: 3),
      animationCurve: Curves.fastEaseInToSlowEaseOut,
      position: const ToastPosition(align: Alignment.bottomCenter),
      onDismiss: () {
        print("the toast dismiss"); // the method will be called on toast dismiss.
      },
    );

  }

  /// Display Success toast
  success(String content) {
    _showToast(ToastType.success, content, Icons.check);
  }

  /// Display Error toast
  void error(String content) {
    _showToast(ToastType.error, content, Icons.error);
  }

  /// Display Info toast
  void info(String content) {
    _showToast(ToastType.info, content, Icons.info);
  }

  /// Display Warning toast
  void warn(String content) {
    _showToast(ToastType.warn, content, Icons.warning);
  }

  /// Construct the toast notification Widget structure
  _buildToast(
    ToastType type,
    String content,
    IconData icon,
  ) {

    return ConstrainedBox(
  constraints: const BoxConstraints(maxHeight: 560, maxWidth: 360),
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: _getToastColor(type).backgroundColor,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: _getToastColor(type).textColor),
        SizedBox(width: 16),
        Flexible(
          child: Text(
            content,
            style: TextStyle(
              color: _getToastColor(type).textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  ),
);
  }
}



