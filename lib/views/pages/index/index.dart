import 'package:template/constants/styles/colors.dart';
import 'package:template/views/components/appBar.dart';
import 'package:template/views/components/cardBox.dart';
import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: theAppBar(context, "课堂"),
      backgroundColor: PageColor,
      body: SafeArea(
        child: Column(
          children: [
            CardBox(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
