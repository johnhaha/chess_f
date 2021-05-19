import 'package:template/constants/styles/colors.dart';
import 'package:flutter/material.dart';

class StarRate extends StatelessWidget {
  const StarRate({
    Key? key,
    required this.rate,
  }) : super(key: key);
  final int rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          rate,
          (index) => Icon(
                Icons.star,
                color: HighLightColor,
                size: 16,
              )),
    );
  }
}
