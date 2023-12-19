import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../style/text_style.dart';
import '../style/theme.dart';

class CustomDatePicker extends StatelessWidget {
  final ValueChanged<String> onDateChanged;
  final DateTime maxDate;
  final DateTime minDate;
  final DateTime initialDate;
  const CustomDatePicker(
      this.onDateChanged,
      this.maxDate,
      this.minDate,
      this.initialDate,
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: DateTimeField(
              initialValue: DateTime.now(),
              format: DateFormat('dd-MM-yyyy'),
              resetIcon:  null,
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: minDate,
                    initialDate: DateTime.now(),
                    lastDate: DateTime.now());
                return date;

              },
              //controller: textEditingControllerCadetFrom,
              obscureText: false,
              keyboardType: TextInputType.visiblePassword,
              autofocus: false,
              onChanged: (text) {
                onDateChanged.call(DateFormat('dd-MM-yyyy').format(text!));
              },
              style: getTextStyle(14, null, AppColors.black),
              decoration: InputDecoration.collapsed(
                hintText: "Search",
                border: InputBorder.none,
              )
          ),
        ),
        Expanded(flex:1,child: Icon(Icons.calendar_today,color: AppColors.greenButton,))
      ],
    );
  }
}