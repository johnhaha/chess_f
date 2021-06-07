import 'package:template/constants/colors.dart';
import 'package:template/views/components/spacer.dart';
import 'package:template/views/components/textInput.dart';
import 'package:template/views/components/theButtons.dart';

import 'package:flutter/material.dart';
import 'package:template/extensions/keyboard.dart';

class ModalInput extends StatefulWidget {
  const ModalInput({
    Key? key,
    required this.inputTitle,
    required this.submitTitle,
    required this.onSubmit,
  }) : super(key: key);
  final String inputTitle;
  final String submitTitle;
  final Function(String) onSubmit;

  @override
  State<ModalInput> createState() => _ModalInputState();
}

class _ModalInputState extends State<ModalInput> {
  late TextEditingController modalInput;
  // late ApplyCardData applyCardData;
  var modalHeight = 300.0;
  var des = "";
  late FocusNode inputFocus;
  void _inputListon() {
    if (inputFocus.hasFocus) {
      print("yeah");
      setState(() {
        modalHeight = 600;
      });
    } else {
      setState(() {
        modalHeight = 300;
      });
    }
  }

  void _onSubmit() {
    if (modalInput.text != "") {
      widget.onSubmit(modalInput.text);
    }
  }

  @override
  void initState() {
    super.initState();
    modalInput = TextEditingController();
    inputFocus = FocusNode();
    inputFocus.addListener(() {
      _inputListon();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => context.hideKeyboard(),
      child: Container(
        color: PageColor,
        height: modalHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              CustomTextInput(
                textEditingController: modalInput,
                title: widget.inputTitle,
                dis: des,
                width: size.width,
                height: 90,
                maxLine: 3,
                focusNode: inputFocus,
              ),
              V20(),
              BigButton(
                // onPress: _applyCampus,
                onPress: _onSubmit,
                txt: widget.submitTitle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
