import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_food_tracker/presentation/core/simple_food_tracker_theme.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      color: Colors.white,
      child: EasyInfiniteDateTimeLine(
        selectionMode: const SelectionMode.autoCenter(),
        firstDate: DateTime(2024),
        focusDate: _focusDate,
        lastDate: DateTime(2024, 12, 31),
        onDateChange: (selectedDate) {
          setState(() {
            _focusDate = selectedDate;
          });
        },
        dayProps: const EasyDayProps(
          height: 82.0,
          width: 42.0,
        ),
        headerBuilder: (context, date) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 4.0,
              right: 4.0,
              bottom: 8.0,
            ),
            child: Row(
              children: [
                Text(
                  '${DateFormat('EEEE').format(date)}, ',
                  style: const TextStyle(
                    color: SimpleFoodTrackerColor.clickAbleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  DateFormat('d MMM yyyy').format(date),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          );
        },
        itemBuilder: (
          BuildContext context,
          DateTime date,
          bool isSelected,
          VoidCallback onTap,
        ) {
          return GestureDetector(
            // You can use `InkResponse` to make your widget clickable.
            // The `onTap` callback responsible for triggering the `onDateChange`
            // callback and animating to the selected date if the `selectionMode` is
            // SelectionMode.autoCenter() or SelectionMode.alwaysFirst().
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(16.0),
                color: isSelected
                    ? SimpleFoodTrackerColor.clickAbleColor
                    : Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      EasyDateFormatter.shortDayName(date, "en_US")
                          .toUpperCase(),
                      style: TextStyle(
                          fontSize: 10,
                          color: isSelected ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: 34.0,
                    height: 34.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Text(
                        date.day.toString(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
