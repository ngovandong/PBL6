import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/extensions/datetime.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/app_text_form_field.widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AppDatePicker extends StatefulWidget {
  final DateTime? initStartDate;
  final DateTime? initEndDate;
  final DateTime? initDate;

  final void Function(DateTime startDate, DateTime endDate)? onSubmitRange;

  final bool isPickRange;

  const AppDatePicker({
    super.key,
    this.initStartDate,
    this.initEndDate,
    this.initDate,
    this.onSubmitRange,
    this.isPickRange = true,
  });

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  final DateRangePickerController dateController = DateRangePickerController();
  final TextEditingController startDateTextController = TextEditingController();
  final TextEditingController endDateTextController = TextEditingController();

  bool isValidate = true;

  @override
  void initState() {
    if (widget.isPickRange) {
      if (widget.initStartDate == null && widget.initEndDate == null) {
        final DateTime dateNow = DateTime.now();
        final DateTime today =
            DateTime(dateNow.year, dateNow.month, dateNow.day);
        final DateTime tomorrow =
            DateTime(dateNow.year, dateNow.month, dateNow.day + 1);
        dateController.selectedRange = PickerDateRange(today, tomorrow);
      } else if (widget.initStartDate != null && widget.initEndDate != null) {
        dateController.selectedRange =
            PickerDateRange(widget.initStartDate, widget.initEndDate);
      }

      setStartAndEndDate(
        dateController.selectedRange!.startDate!,
        dateController.selectedRange!.endDate,
      );
    } else {
      if (widget.initDate != null) {
        dateController.selectedDate = widget.initDate;
      } else {
        dateController.selectedDate = DateTime.now();
      }

      setStartAndEndDate(
        dateController.selectedDate!,
        null,
      );
    }

    super.initState();
  }

  void setStartAndEndDate(DateTime startDate, DateTime? endDate) {
    if (widget.isPickRange) {
      startDateTextController.text = startDate.toShowUIDate();
      if (endDate == null) {
        endDateTextController.text = '';
      } else {
        endDateTextController.text = endDate.toShowUIDate();
      }
    } else {
      startDateTextController.text = startDate.toShowUIDate();
      endDateTextController.text = '';
    }
  }

  void onSelectionChanged(
    DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs,
  ) {
    final dynamic dateRangeValue = dateRangePickerSelectionChangedArgs.value;

    if (widget.isPickRange) {
      setStartAndEndDate(
        (dateRangeValue as PickerDateRange).startDate!,
        dateRangeValue.endDate,
      );

      setState(() {
        isValidate = dateRangeValue.endDate != null;
      });

      log(isValidate.toString());
    } else {
      setStartAndEndDate((dateRangeValue as DateTime), null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 1.6,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: SfDateRangePicker(
              controller: dateController,
              selectionMode: widget.isPickRange
                  ? DateRangePickerSelectionMode.range
                  : DateRangePickerSelectionMode.single,
              minDate: DateTime.now(),
              showNavigationArrow: true,
              headerStyle: const DateRangePickerHeaderStyle(
                textAlign: TextAlign.center,
                textStyle: TextStyles.s17BoldText,
              ),
              startRangeSelectionColor: Palette.blue400,
              endRangeSelectionColor: Palette.blue400,
              selectionTextStyle:
                  TextStyles.s14MediumText.copyWith(color: Colors.white),
              rangeTextStyle:
                  TextStyles.s14MediumText.copyWith(color: Palette.blue400),
              selectionRadius: 20,
              headerHeight: 45,
              monthViewSettings: const DateRangePickerMonthViewSettings(
                showTrailingAndLeadingDates: true,
                viewHeaderStyle: DateRangePickerViewHeaderStyle(
                  textStyle: TextStyles.s14BoldText,
                ),
                //Locales.vi => 1
                firstDayOfWeek: 1,
              ),
              yearCellStyle: const DateRangePickerYearCellStyle(
                todayTextStyle: TextStyles.s14RegularText,
              ),
              monthCellStyle: const DateRangePickerMonthCellStyle(
                leadingDatesTextStyle: TextStyles.s14RegularText,
                trailingDatesTextStyle: TextStyles.s14RegularText,
              ),
              todayHighlightColor: Palette.zodiacBlue,
              onSelectionChanged: onSelectionChanged,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: UIConfigs.horizontalPadding,
            ),
            child: Column(
              children: [
                widget.isPickRange
                    ? SizedBox(
                        height: 64,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Ngày nhận phòng',
                                  style: TextStyles.s14BoldText,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: (Get.width / 2) - 40,
                                  child: AppTextFormField(
                                    textController: startDateTextController,
                                    extendField: false,
                                    readOnly: true,
                                    enabled: false,
                                    isCenterText: true,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                children: const [
                                  Spacer(),
                                  SizedBox(
                                    width: 15,
                                    child: Divider(
                                      thickness: 2,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Ngày trả phòng',
                                  style: TextStyles.s14BoldText,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: (Get.width / 2) - 40,
                                  child: AppTextFormField(
                                    textController: endDateTextController,
                                    extendField: false,
                                    readOnly: true,
                                    enabled: false,
                                    isCenterText: true,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 15,
                ),
                AppRoundedButton(
                  onPressed: () {
                    if (widget.isPickRange) {
                      final PickerDateRange selectedRange =
                          dateController.selectedRange!;
                      widget.onSubmitRange!(
                        selectedRange.startDate!,
                        selectedRange.endDate!,
                      );
                    }

                    Get.back();
                  },
                  content: 'Chọn ngày',
                  fontSize: 15,
                  showShadow: false,
                  height: 45,
                  backgroundColor: Palette.blue400,
                  isDisable: !isValidate,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
