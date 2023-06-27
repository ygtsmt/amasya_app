import "package:flutter/material.dart";
import "package:injectable/injectable.dart";
import "package:amasyaapp/core/keys.dart";
import "package:amasyaapp/generated/l10n.dart";

@injectable
class SnackBarService {
  void showSnackBar(final String? message) {
    final snackBar = SnackBar(
      elevation: 2,
      behavior: SnackBarBehavior.fixed,
      content: Text(message ?? AppLocalizations.current.common_error),
    );

    snackbarKey.currentState?.hideCurrentSnackBar();
    snackbarKey.currentState?.showSnackBar(snackBar);
  }
}
