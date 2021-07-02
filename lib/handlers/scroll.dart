import 'package:flutter/material.dart';

void scrollListener(
    {required ScrollController controller,
    required int minCount,
    required Function onScrollBottom,
    required Function onScrollTop}) {
  if (controller.offset >= controller.position.maxScrollExtent &&
      !controller.position.outOfRange) {
    print("到底咯");
    // showTextToast(context, "到底咯");
    if (minCount >= 10) {
      onScrollBottom();
    }
  }
  if (controller.offset <= controller.position.minScrollExtent &&
      !controller.position.outOfRange) {
    onScrollTop();
    //TODO 下拉刷新

  }
}
