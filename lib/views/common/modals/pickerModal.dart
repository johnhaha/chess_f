import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/views/common/buttons/bigButton.dart';
import 'package:template/views/common/inputs/textInput.dart';
import 'package:template/views/common/layout/spacer.dart';
import 'package:template/extensions/screen.dart';

Future showPickerModal({
  required BuildContext context,
  required FixedExtentScrollController leftController,
  required FixedExtentScrollController rightController,
  required List<Widget> leftWidgets,
  required List<Widget> rightWidgets,
  required Function(int, StateSetter) updateLeftPicker,
  required Function(int, StateSetter) updateRightPicker,
  required Function(int, int) onConfirm,
}) async {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          return Container(
            height: 360,
            child: Column(
              children: [
                V20(),
                Container(
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Center(
                          child: CupertinoPicker(
                              diameterRatio: 1.1,
                              scrollController: leftController,
                              itemExtent: 48,
                              onSelectedItemChanged: (value) {
                                var changeFlag =
                                    updateLeftPicker(value, setModalState);
                                if (changeFlag != null) {
                                  rightWidgets = changeFlag;
                                  setModalState(() {});
                                }
                              },
                              children: leftWidgets),
                        ),
                      ),
                      Expanded(
                        child: CupertinoPicker(
                            scrollController: rightController,
                            itemExtent: 48,
                            onSelectedItemChanged: (value) {
                              updateRightPicker(value, setModalState);
                            },
                            children: rightWidgets),
                      ),
                    ],
                  ),
                ),
                V60(),
                BigButton(
                    txt: '确认',
                    onPress: () {
                      onConfirm(leftController.selectedItem,
                          rightController.selectedItem);
                    })
              ],
            ),
          );
        });
      });
}

Future showPickerWithInputModal(
    {required BuildContext context,
    required List<Widget> leftWidgets,
    required List<Widget> rightWidgets,
    required Function(int) updateLeftPicker,
    required Function(int) updateRightPicker,
    required Function(int, int, String) onConfirm,
    int leftInit = 0,
    int rightInit = 0,
    bool lockLeft = false,
    bool lockRight = false,
    bool lockText = false,
    String initText = ""}) async {
  var inputFocus = FocusNode();
  var leftController = FixedExtentScrollController(initialItem: leftInit);
  var rightController = FixedExtentScrollController(initialItem: rightInit);
  var controller = TextEditingController(text: initText);
  double containerHeight = 520;
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          inputFocus.addListener(() {
            if (inputFocus.hasFocus) {
              print("on focus now");
              containerHeight = 780;
              setModalState(() {});
            } else {
              print("lose focus now");
              containerHeight = 520;
              setModalState(() {});
            }
          });
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => context.hideKeyboard(),
            child: Container(
              height: containerHeight,
              child: Column(
                children: [
                  V20(),
                  Container(
                    height: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Center(
                            child: CupertinoPicker(
                                diameterRatio: 1.1,
                                scrollController: leftController,
                                itemExtent: 48,
                                onSelectedItemChanged: (value) {
                                  if (lockLeft) {
                                    leftController.jumpToItem(leftInit);
                                    return;
                                  }
                                  var changeFlag = updateLeftPicker(value);
                                  if (changeFlag != null) {
                                    rightWidgets = changeFlag;
                                    setModalState(() {});
                                  }
                                },
                                children: leftWidgets),
                          ),
                        ),
                        Expanded(
                          child: CupertinoPicker(
                              scrollController: rightController,
                              itemExtent: 48,
                              onSelectedItemChanged: (value) {
                                if (lockRight) {
                                  rightController.jumpToItem(rightInit);
                                  return;
                                }
                                updateRightPicker(value);
                              },
                              children: rightWidgets),
                        ),
                      ],
                    ),
                  ),
                  V20(),
                  CustomTextInput(
                    enabled: !lockText,
                    textEditingController: controller,
                    title: "详细地址",
                    width: context.getSize().width - 64,
                    focusNode: inputFocus,
                  ),
                  V60(),
                  BigButton(
                      txt: '确认',
                      onPress: () {
                        onConfirm(leftController.selectedItem,
                            rightController.selectedItem, controller.text);
                      })
                ],
              ),
            ),
          );
        });
      });
}
