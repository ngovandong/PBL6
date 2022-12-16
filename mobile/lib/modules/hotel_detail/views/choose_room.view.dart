import 'package:flutter/material.dart';
import 'package:mobile/modules/hotel_detail/widgets/choose_room/booking_room_button.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/choose_room/choose_room_app_bar.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/choose_room/list_room/list_room.widget.dart';

class ChooseRoomView extends StatelessWidget {
  const ChooseRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ChooseRoomAppBar(),
      ),
      body: const ListRoom(),
      bottomNavigationBar: const BookingRoomButton(),
    );
  }
}

// 