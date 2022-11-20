import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/common/widgets/hotel_info_card.widget.dart';
import 'package:mobile/generated/locales.g.dart';

class BookingHistoryView extends StatefulWidget {
  const BookingHistoryView({super.key});

  @override
  State<BookingHistoryView> createState() => _BookingHistoryViewState();
}

class _BookingHistoryViewState extends State<BookingHistoryView>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        title: Text(
          LocaleKeys.booking_history_title.tr,
          style: TextStyles.s17BoldText,
        ),
        titleSpacing: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Palette.blue400,
          unselectedLabelColor: Palette.gray300,
          labelColor: Palette.blue400,
          tabs: [
            Tab(
              text: LocaleKeys.booking_history_ongoing.tr,
            ),
            Tab(
              text: LocaleKeys.booking_history_ordered.tr,
            ),
            Tab(
              text: LocaleKeys.booking_history_cancel.tr,
            )
          ],
        ),
        actions: [
          AppIconButton(
            onPressed: () {
              Get.toNamed(RouteManager.findBookingHistory);
            },
            height: double.infinity,
            width: 50,
            hasBorder: false,
            icon: const Icon(
              Icons.search,
              color: Palette.blue400,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          UIConfigs.horizontalPadding,
          0,
          UIConfigs.horizontalPadding,
          0,
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            ListView.separated(
              itemCount: 5,
              padding: const EdgeInsets.only(top: UIConfigs.horizontalPadding),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (context, index) {
                return const HotelInfoCard();
              },
            ),
            const Text('data'),
            const Text('data'),
          ],
        ),
      ),
      backgroundColor: Palette.background,
    );
  }
}
