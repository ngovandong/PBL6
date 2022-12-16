import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/common/widgets/error_view.widget.dart';
import 'package:mobile/common/widgets/loading_dot.widget.dart';
import 'package:mobile/common/widgets/login_view_data.widget.dart';
import 'package:mobile/generated/assets.gen.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/booking_history/controllers/booking_history.controller.dart';
import 'package:mobile/modules/booking_history/widgets/booking_history_data.widget.dart';

class BookingHistoryView extends StatefulWidget {
  const BookingHistoryView({super.key});

  @override
  State<BookingHistoryView> createState() => _BookingHistoryViewState();
}

class _BookingHistoryViewState extends State<BookingHistoryView>
    with TickerProviderStateMixin {
  final BookingHistoryController _bookingHistoryController =
      Get.find<BookingHistoryController>();

  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: _bookingHistoryController.getDataStatus.value ==
                HandleStatus.HAS_DATA
            ? CustomAppBar(
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
              )
            : null,
        body: Obx(
          () {
            switch (_bookingHistoryController.getDataStatus.value) {
              case HandleStatus.HAS_DATA:
                return BookingHistoryData(
                  tabController: _tabController,
                );
              case HandleStatus.LOADING:
                return const Center(
                  child: LoadingDot(
                    dotColor: Palette.blue400,
                  ),
                );
              case HandleStatus.HAS_ERROR:
                return const ErrorBanner(
                  showAction: false,
                );
              case HandleStatus.NORMAL:
                return LoginViewData(
                  lottiePath: Assets.lotties.loadingTravel,
                  title: 'Hiện bạn đang không có đơn đặt nào',
                  content: 'Đăng nhập để xem tất cả đơn đặt đang có hiệu lực',
                );
            }
          },
        ),
        backgroundColor: Palette.background,
      );
    });
  }
}
