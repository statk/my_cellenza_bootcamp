import 'package:flutter/cupertino.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SnackBarDialog {
  void show(String message, BuildContext context, SnackBarType type) {
    showTopSnackBar(
      context,
      type.snackBar(message),
    );
  }
}

enum SnackBarType {
  success,
  error,
  info,
}

extension _SnackBarTypeExtension on SnackBarType {
  CustomSnackBar snackBar(String title) {
    switch (this) {
      case SnackBarType.success:
        return CustomSnackBar.success(message: title);
      case SnackBarType.error:
        return CustomSnackBar.error(message: title);
      case SnackBarType.info:
        return CustomSnackBar.success(message: title);
    }
  }
}
