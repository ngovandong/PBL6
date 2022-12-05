import 'package:flutter/material.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/extensions/number.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterOptionsSheet extends StatefulWidget {
  const FilterOptionsSheet({super.key});

  @override
  State<FilterOptionsSheet> createState() => _FilterOptionsSheetState();
}

class _FilterOptionsSheetState extends State<FilterOptionsSheet> {
  final List<String> starOptions = [
    'Không xếp hạng',
    '1 sao',
    '2 sao',
    '3 sao',
    '4 sao',
    '5 sao'
  ];
  List<String> selectedStarOptions = [];
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
          children: starOptions
              .asMap()
              .map((index, e) {
                final bool isSelected = selectedStarOptions
                    .where((element) => element == e)
                    .isNotEmpty;

                return MapEntry(
                  index,
                  FilterChip(
                    label: Text(
                      e,
                      style: TextStyles.s14MediumText.copyWith(
                        color:
                            isSelected ? Palette.blue400 : Palette.zodiacBlue,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (bool value) {
                      if (value) {
                        setState(() {
                          selectedStarOptions.add(e);
                        });
                      } else {
                        setState(() {
                          selectedStarOptions.remove(e);
                        });
                      }
                    },
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: const EdgeInsets.all(10),
                    showCheckmark: false,
                    selectedColor: Colors.white,
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: isSelected ? Palette.blue400 : Palette.gray300,
                    ),
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
