# How to customize the month cell of the Flutter date range picker (SfDateRangePicker)?

In the flutter date range picker, you can customize the month cells by using the `specialDates`, `blackoutDates`, and `showTrailingAndLeadingDates` properties.

## Step 1:
In initState(), set the default dates for special, blackout dates, and set the default color values for the weekend days, special dates, current date, blackout dates, leading and trailing dates.

```xml
DateRangePickerController _controller;
List<DateTime> _blackoutDates;
List<DateTime> _specialDates;
Color weekEndColor,
    specialDatesColor,
    todayColor,
    leadingTrailingDatesColor,
    blackoutDatesColor;
 
@override
void initState() {
  // TODO: implement initState
  _controller = DateRangePickerController();
  _blackoutDates = _getBlackoutDates();
  _specialDates = _getSpecialDates();
  weekEndColor = Color(0xFF0e9aa7);
  leadingTrailingDatesColor = Color(0xFF88d8b0);
  specialDatesColor = Color(0xFFf6cd61);
  todayColor = Color(0xFFff6f69);
  blackoutDatesColor = Colors.black;
  super.initState();
}
```
 

## Step 2:
Place the calendar inside the body of the Scaffold widget. Using the `TextStyle` and `BoxDecoration` widget you can customize the dates with shapes and colors. In the same way, you can also customize the blackout dates.

```xml
body: Card(
  margin: const EdgeInsets.fromLTRB(40, 150, 40, 150),
  child: SfDateRangePicker(
    view: DateRangePickerView.month,
    monthViewSettings: DateRangePickerMonthViewSettings(
        specialDates: _specialDates,
        showTrailingAndLeadingDates: true,
        blackoutDates: _blackoutDates),
    monthCellStyle: DateRangePickerMonthCellStyle(
        blackoutDateTextStyle: TextStyle(
            color: blackoutDatesColor,
            decoration: TextDecoration.lineThrough),
        specialDatesDecoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1),
            color: specialDatesColor),
        specialDatesTextStyle: TextStyle(color: Colors.black),
        cellDecoration: BoxDecoration(shape: BoxShape.circle),
        selectionColor: Color(0xFFf8dbdff),
        todayTextStyle: TextStyle(color: Colors.white),
        todayCellDecoration:
            BoxDecoration(shape: BoxShape.circle, color: todayColor),
        weekendDatesDecoration: BoxDecoration(
            color: weekEndColor,
            border: Border.all(width: 1),
            shape: BoxShape.circle),
        trailingDatesDecoration: BoxDecoration(
            shape: BoxShape.rectangle, color: leadingTrailingDatesColor),
        leadingDatesDecoration: BoxDecoration(
            shape: BoxShape.rectangle, color: leadingTrailingDatesColor)),
    todayHighlightColor: Colors.orange,
  ),
));
```
**[View document in Syncfusion Flutter Knowledge base](https://www.syncfusion.com/kb/11307/how-to-customize-the-month-cell-of-the-flutter-date-range-picker-sfdaterangepicker)**

**Screenshot**

<img alt="Customization"  src="http://www.syncfusion.com/uploads/user/kb/flut/flut-858/flut-858_img1.png" width="250" height="250" />|
