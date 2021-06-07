import 'package:template/constants/colors.dart';
import 'package:flutter/material.dart';

class NumberAdderWithTitle extends StatefulWidget {
  const NumberAdderWithTitle(
      {Key? key,
      required this.maxNumber,
      required this.minNumber,
      required this.onAdd,
      required this.onMinus,
      this.initNumber,
      required this.title,
      required this.measure})
      : super(key: key);

  final int maxNumber;
  final int minNumber;
  final Function(int) onAdd;
  final Function(int) onMinus;
  final int? initNumber;
  final String title;
  final String measure;

  @override
  _NumberAdderWithTitleState createState() => _NumberAdderWithTitleState();
}

class _NumberAdderWithTitleState extends State<NumberAdderWithTitle> {
  var minNumber = 0;
  var maxNumber = 0;
  var currentNumber = 0;

  void _addNumber() {
    if (currentNumber < maxNumber) {
      currentNumber++;
      widget.onAdd(currentNumber);
      setState(() {});
    }
  }

  void _minusNumber() {
    if (currentNumber > minNumber) {
      currentNumber--;
      widget.onMinus(currentNumber);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    minNumber = widget.minNumber;
    maxNumber = widget.maxNumber;
    currentNumber = minNumber;
    if (widget.initNumber != null) {
      currentNumber = widget.initNumber! > 0 && widget.initNumber! <= maxNumber
          ? widget.initNumber!
          : 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        // color: Colors.pink,
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: _minusNumber,
                      icon: Icon(
                        Icons.remove_circle,
                        color: currentNumber > minNumber
                            ? theme.primaryColor
                            : DisColor,
                      )),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$currentNumber",
                            style: theme.textTheme.bodyText1,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(widget.measure)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  IconButton(
                      onPressed: _addNumber,
                      icon: Icon(
                        Icons.add_circle,
                        color: currentNumber < maxNumber
                            ? theme.primaryColor
                            : DisColor,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
