import 'package:flutter/cupertino.dart';

class Dialogs {
  static void showLoadingDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CupertinoAlertDialog(
        content: Row(
          children: [
            CupertinoActivityIndicator(),
            SizedBox(width: 16),
            Text("Loading..."),
          ],
        ),
      ),
    );
  }

  static void showErrorDialog(BuildContext context, String errorMessage) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CupertinoAlertDialog(
        title: Text("Error"),
        content: Text(errorMessage),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

   static void showConfirmationDialog(BuildContext context, String title, String message, Function()? onConfirm) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
              if (onConfirm != null) {
                onConfirm();
              }
            },
            child: Text('Start'),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }


}



