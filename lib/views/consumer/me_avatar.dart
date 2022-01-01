import 'package:chess/data/app_data.dart';
import 'package:chess/views/component/chat_avatar.dart';
import 'package:chess/views/pop/user_pop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hole/init.dart';
import 'package:magic/magic.dart';
import 'package:ku/ku.dart';

class MeAvatar extends ConsumerWidget {
  const MeAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var me = ref.watch(appData).me;
    if (me == null) {
      return const SizedBox();
    }
    return ChatAvatar(avatar: holeMediaAssets.getUrl(me.avatar), name: me.name)
        .gesture(
      ontap: () {
        MagicModal.show(context,
            child: UserPop(
              userID: me.userID,
              isChating: false,
              me: me,
              onUpdateInfo: (u) {
                ref.read(appData).updateMeFromUserInfo(u);
              },
            ).size(
                height:
                    MagicModal.getHeight(MagicArea.small, context).min(380)));
      },
    );
  }
}
