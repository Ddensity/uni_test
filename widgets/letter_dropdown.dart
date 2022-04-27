import 'package:flutter/material.dart';
import 'package:uni_test/constants/constant.dart';
import 'package:uni_test/Helper/helper.dart';

class LetterDropdownWidget extends StatefulWidget {
  final Function onLetterSelected;

  const LetterDropdownWidget({required this.onLetterSelected, Key? key})
      : super(key: key);

  @override
  State<LetterDropdownWidget> createState() => _LetterDropdownWidgetState();
}

class _LetterDropdownWidgetState extends State<LetterDropdownWidget> {
  double selectedLetterValue = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<double>(
        value: selectedLetterValue,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (selected) {
          setState(() {
            selectedLetterValue = selected!;
            widget.onLetterSelected(selectedLetterValue);
          });
        },
        underline: Container(),
        items: DataHelper.allLetterGrades(),
      ),
    );
  }
}