import 'package:flutter/material.dart';

class NormalCustomScrollView extends StatefulWidget {
  const NormalCustomScrollView(
      {Key? key,
      required this.slivers,
      required this.controller,
      required this.onScroll})
      : super(key: key);
  final List<Widget> slivers;
  final ScrollController controller;
  final Function onScroll;

  @override
  State<NormalCustomScrollView> createState() => _NormalCustomScrollViewState();
}

class _NormalCustomScrollViewState extends State<NormalCustomScrollView> {
  void _onScroll() {
    widget.onScroll();
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: widget.controller,
        slivers: widget.slivers,
      ),
    );
  }
}
