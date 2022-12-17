import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:mobile/common/extensions/number.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/icon_title.widget.dart';
import 'package:mobile/modules/booking_history/data/models/booking.dto.dart';

class HotelInfoCard extends StatelessWidget {
  final BookingDTO bookingParams;

  const HotelInfoCard({
    super.key,
    required this.bookingParams,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 150,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    bookingParams.avatarImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookingParams.hostName!,
                      style: TextStyles.s17BoldText,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    IconTitle(
                      icon: Icons.meeting_room_outlined,
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              bookingParams.bookingDetails.length, (index) {
                            return Text(
                              bookingParams
                                  .bookingDetails[index].accommodationName!,
                            );
                          }),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    IconTitle(
                      icon: PhosphorIcons.map_pin,
                      title: bookingParams.province,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    IconTitle(
                      icon: PhosphorIcons.calendar_check,
                      title: bookingParams.displayDate,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    // const IconTitle(
                    //   icon: PhosphorIcons.user,
                    //   title: '2 khách',
                    // )
                  ],
                ),
              )
            ],
          ),
          const Divider(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              bookingParams.totalPrice!.toMoneyFormat,
              style: TextStyles.s17BoldText.copyWith(color: Palette.red400),
            ),
          )
        ],
      ),
    );
  }
}
