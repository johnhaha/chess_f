import 'package:flutter/material.dart';
import 'package:template/utility/debouncer.dart';
import 'package:template/views/common/bases/normalCustomScrollView.dart';
import 'package:template/views/common/bases/normalPage.dart';
import 'package:template/views/common/search/searchInput.dart';

class SearchPage extends StatefulWidget {
  const SearchPage(
      {Key? key,
      required this.children,
      required this.searchPage,
      required this.onSearch})
      : super(key: key);
  final List<Widget> children;

  final List<Widget> searchPage;

  final Function(String) onSearch;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late ScrollController scrollController;
  var searchInput = TextEditingController();
  bool isInputing = false;
  var focusNode = FocusNode();
  var debouncer = Debouncer(milliseconds: 500);

  void listenToInput() {
    if (searchInput.text != "") {
      isInputing = true;
      debouncer.run(() {
        widget.onSearch(searchInput.text);
        setState(() {});
      });
    } else if (isInputing && searchInput.text == "") {
      print("stop input");
      isInputing = false;
      setState(() {});
    }
  }

  void _onScroll() {
    if (focusNode.hasFocus) {
      focusNode.unfocus();
    }
  }

  void _clear() {
    searchInput.text = "";
    isInputing = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    searchInput.addListener(listenToInput);
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NormalPage(
        child: NormalCustomScrollView(
      controller: scrollController,
      onScroll: _onScroll,
      slivers: [
        SliverToBoxAdapter(
            child: SearchInput(
          focusNode: focusNode,
          searchInput: searchInput,
          isInputing: isInputing,
          clear: _clear,
        )),
        if (!isInputing) ...widget.children,
        if (isInputing) ...widget.searchPage
      ],
    ));
  }
}
