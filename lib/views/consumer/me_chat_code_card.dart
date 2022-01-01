import 'package:chess/data/app_data.dart';
import 'package:chess/views/component/chat_code_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MeChatCode extends ConsumerWidget {
  const MeChatCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var meCode = ref.watch(appData).code;
    if (meCode == null) {
      return const SizedBox();
    }
    return ChatCodeCard(chatCode: meCode);
  }
}
