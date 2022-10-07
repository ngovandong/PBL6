import 'package:flutter/material.dart';
import 'package:mobile/modules/home/widgets/search_hotels/searched_hotel_item.widget.dart';

class ListSearchedHotels extends StatelessWidget {
  const ListSearchedHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      separatorBuilder: ((context, index) {
        return const SizedBox(
          height: 10,
        );
      }),
      itemBuilder: (context, index) {
        return const SearchedHotelItem();
      },
    );
  }
}
