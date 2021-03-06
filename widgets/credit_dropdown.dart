import 'package:flutter/material.dart';
import 'package:uni_test/constants/constant.dart';
import 'package:uni_test/Helper/helper.dart';

class CreditDropdownWidget extends StatefulWidget {
  final Function onCreditSelected;
  const CreditDropdownWidget({required this.onCreditSelected, Key? key})
      : super(key: key);

  @override
  State<CreditDropdownWidget> createState() => _CreditDropdownWidgetState();
}

class _CreditDropdownWidgetState extends State<CreditDropdownWidget> {
  double selectedCreditValue = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<double>(
        value: selectedCreditValue,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (selected) {
          setState(() {
            selectedCreditValue = selected!;
            widget.onCreditSelected(selectedCreditValue);
          });
        },
        underline: Container(),
        items: DataHelper.allCourseCredits(),
      ),
    );
  }
}