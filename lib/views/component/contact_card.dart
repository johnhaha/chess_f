import 'package:flutter/material.dart';
import 'package:hole/init.dart';
import 'package:magic/components/avatar/round_avatar.dart';
import 'package:steam/contact.dart';
import 'package:magic/magic.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contactInfo}) : super(key: key);
  final ContactInfo contactInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatar(
          magicArea: MagicArea.normal,
          url: holeMediaAssets.getUrl(contactInfo.userAvatar ?? ""),
          name: contactInfo.userName ?? contactInfo.name,
        ),
        MagicMargin(magicArea: MagicArea.small).horizontal(),
        Text(contactInfo.userName ?? contactInfo.name)
      ],
    ).card();
  }
}
