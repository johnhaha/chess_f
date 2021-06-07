import 'dart:io';

import 'package:template/constants/colors.dart';
import 'package:flutter/material.dart';

class ChoosenImage extends StatefulWidget {
  const ChoosenImage({
    Key? key,
    required this.image,
    required this.onDelete,
    required this.index,
  }) : super(key: key);

  final File image;
  final int index;
  final Function(int) onDelete;

  @override
  _ChoosenImageState createState() => _ChoosenImageState();
}

class _ChoosenImageState extends State<ChoosenImage> {
  bool showDelete = false;
  void _toggleDel() {
    showDelete = !showDelete;
    setState(() {});
  }

  void _onDelete() {
    widget.onDelete(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        GestureDetector(
          onTap: _toggleDel,
          child: Image.file(
            widget.image,
            fit: BoxFit.cover,
          ),
        ),
        if (showDelete)
          Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: _onDelete,
                child: Icon(
                  Icons.remove_circle,
                  color: MainColor,
                ),
              ))
      ],
    );

    // Positioned(top: 10, right: 10, child: Icon(Icons.delete))
  }
}
