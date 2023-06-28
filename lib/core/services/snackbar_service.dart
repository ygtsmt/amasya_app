import "package:flutter/material.dart";
import "package:injectable/injectable.dart";
import "package:amasyaapp/core/keys.dart";

@injectable
class SnackBarService {
  void showSnackBar(final String? message) {
    final snackBar = SnackBar(
      elevation: 2,
      behavior: SnackBarBehavior.fixed,
      content: Text(message ?? "error"),
    );

    snackbarKey.currentState?.hideCurrentSnackBar();
    snackbarKey.currentState?.showSnackBar(snackBar);
  }
}
