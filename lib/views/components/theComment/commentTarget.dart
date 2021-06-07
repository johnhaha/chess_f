import 'package:template/constants/colors.dart';
import 'package:template/constants/theme.dart';
import 'package:template/views/components/spacer.dart';
import 'package:flutter/material.dart';

class CommentTarget extends StatelessWidget {
  const CommentTarget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "本周很多人都没交作业",
            style: bodyText1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("2021-12-12 12:00"),
              Row(
                children: [
                  Text("11"),
                  H10(),
                  Icon(
                    Icons.comment,
                    color: ClickColor,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
