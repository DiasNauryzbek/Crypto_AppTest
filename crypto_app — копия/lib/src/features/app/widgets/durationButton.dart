import 'package:crypto_app/src/core/resources/app_colors.dart';
import 'package:crypto_app/src/core/widgets/bold_text.dart';
import 'package:flutter/material.dart';
class SelectDuration extends StatefulWidget {
  final String durationText;
  final String selectedDuration;
  final Function(String) updateSelectedDuration;

  SelectDuration({
    Key? key,
    required this.durationText,
    required this.selectedDuration,
    required this.updateSelectedDuration,
  }) : super(key: key);

  @override
  _SelectDurationState createState() => _SelectDurationState();
}

class _SelectDurationState extends State<SelectDuration> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.updateSelectedDuration(widget.durationText);
      },
      child: Container(
        height: 17,
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: widget.selectedDuration == widget.durationText
              ? AppColors.greenColor
              : AppColors.whiteColor,
        ),
        alignment: Alignment.center,
        child: boldText(
          widget.durationText,
          14,
          widget.selectedDuration == widget.durationText
              ? AppColors.whiteColor
              : AppColors.blackColor,
        ),
      ),
    );
  }
}


