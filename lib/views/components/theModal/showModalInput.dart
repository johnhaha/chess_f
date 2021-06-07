import 'package:template/views/components/theModal/modalInput.dart';
import 'package:flutter/material.dart';

void showModalInput(BuildContext context, String inputTitle, String submitTitle,
    Function(String) onSubmit) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ModalInput(
            inputTitle: inputTitle,
            submitTitle: submitTitle,
            onSubmit: onSubmit);
      });
}
