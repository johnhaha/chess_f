import 'package:template/constants/styles/colors.dart';
import 'package:template/constants/styles/theme.dart';
import 'package:flutter/material.dart';

void showPayModel(BuildContext context, Function buySkill) {
  // var size = MediaQuery.of(context).size;
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 240,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 140,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: HighLightColor, width: 4)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/alipaylogo.png",
                              width: 32,
                              height: 32,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "支付宝",
                              style: TextStyle(fontSize: 18, color: TextColor),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "88元一次",
                      style: highLightText,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        print("okok");
                        var res = await buySkill();
                        if (res) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text("支付"),
                      style: bigButtonStyle,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}
