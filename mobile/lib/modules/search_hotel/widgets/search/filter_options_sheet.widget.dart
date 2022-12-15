import 'package:flutter/material.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/extensions/number.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/utils/utility_content.util.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterOptionsSheet extends StatefulWidget {
  final int selectedStar;
  final List<String> selectedUtilities;

  const FilterOptionsSheet({
    super.key,
    this.selectedStar = -1,
    this.selectedUtilities = const [],
  });

  @override
  State<FilterOptionsSheet> createState() => FilterOptionsSheetState();
}

class FilterOptionsSheetState extends State<FilterOptionsSheet> {
  final List<String> _starOptions = [
    '1 sao',
    '2 sao',
    '3 sao',
    '4 sao',
    '5 sao'
  ];

  late int selectedStar;
  late List<String> selectedUtilities;

  @override
  void initState() {
    selectedStar = widget.selectedStar;
    selectedUtilities = widget.selectedUtilities.toList();

    super.initState();
  }

  SfRangeValues _values = const SfRangeValues(0.0, 6000000.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mức giá',
          style: TextStyles.s17BoldText,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: UIConfigs.horizontalPadding,
            right: UIConfigs.horizontalPadding,
            top: 55,
          ),
          child: SfRangeSlider(
            max: 6000000,
            values: _values,
            interval: 6000000,
            stepSize: 10000,
            showLabels: true,
            labelFormatterCallback: (actualValue, formattedText) {
              return '${(actualValue.toInt() as int).toCompact} VND';
            },
            enableTooltip: true,
            shouldAlwaysShowTooltip: true,
            onChanged: (SfRangeValues values) {
              setState(() {
                _values = values;
              });
            },
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Xếp hạng sao',
          style: TextStyles.s17BoldText,
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _starOptions
              .asMap()
              .map((index, e) {
                final bool isSelected = (index == selectedStar - 1);

                return MapEntry(
                  index,
                  CustomFilterChip(
                    isSelected: isSelected,
                    onSelected: (bool value) {
                      if (value) {
                        setState(() {
                          selectedStar = index + 1;
                        });
                      } else {
                        setState(() {
                          selectedStar = -1;
                        });
                      }
                    },
                    value: e,
                  ),
                );
              })
              .entries
              .map((e) => e.value)
              .toList(),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Những tiện ích',
          style: TextStyles.s17BoldText,
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: UtilityCode.listUtilityCodes
              .asMap()
              .map((index, e) {
                final bool isSelected = selectedUtilities
                    .where((element) => element == e)
                    .isNotEmpty;

                return MapEntry(
                  index,
                  CustomFilterChip(
                    isSelected: isSelected,
                    onSelected: (bool value) {
                      if (value) {
                        setState(() {
                          selectedUtilities.add(e);
                        });
                      } else {
                        setState(() {
                          selectedUtilities.remove(e);
                        });
                      }
                    },
                    value: UtilityContentUtil.getLabel(e),
                  ),
                );
              })
              .entries
              .map((e) => e.value)
              .toList(),
        )
      ],
    );
  }
}

class CustomFilterChip extends StatelessWidget {
  final String value;
  final Function(bool) onSelected;
  final bool isSelected;

  const CustomFilterChip({
    super.key,
    required this.value,
    required this.onSelected,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        value,
        style: TextStyles.s14MediumText.copyWith(
          color: isSelected ? Palette.blue400 : Palette.zodiacBlue,
        ),
      ),
      selected: isSelected,
      onSelected: onSelected,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.all(10),
      showCheckmark: false,
      selectedColor: Colors.white,
      backgroundColor: Colors.white,
      side: BorderSide(
        color: isSelected ? Palette.blue400 : Palette.gray300,
      ),
    );
  }
}
