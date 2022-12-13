import 'package:flutter/material.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/utils/utility_content.util.dart';
import 'package:mobile/modules/search_hotel/data/models/accommodation.model.dart';

class RoomUtilities extends StatelessWidget {
  final AccommodationModel currentRoom;

  const RoomUtilities({
    super.key,
    required this.currentRoom,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Wrap(
        clipBehavior: Clip.hardEdge,
        children: List.generate(
          currentRoom.realUtilities.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        UtilityContentUtil.getIcon(
                          currentRoom.realUtilities[index],
                        ),
                        size: 17,
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(width: 3),
                    ),
                    TextSpan(
                      text: UtilityContentUtil.getLabel(
                        currentRoom.realUtilities[index],
                      ),
                      style: TextStyles.s14RegularText,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
