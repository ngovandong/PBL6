import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppBar(
          backgroundColor: Colors.white,
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
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Wrap(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 150,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://phuot3mien.com/wp-content/uploads/2020/03/cau-rong-da-nang-phuot3mien.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Coco Hotel',
                                style: TextStyles.s17BoldText,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.bed_rounded,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Phòng Deluxe',
                                    style: TextStyles.s14RegularText,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    PhosphorIcons.map_pin,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Hội An, Quảng Nam',
                                    style: TextStyles.s14RegularText,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    PhosphorIcons.calendar_check,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '12/10/2022 - 20/10/2022',
                                    style: TextStyles.s14RegularText,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    PhosphorIcons.user,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '2 khách',
                                    style: TextStyles.s14RegularText,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '916.667 đ',
                          style: TextStyles.s17BoldText
                              .copyWith(color: Palette.red400),
                        ),
                      ),
                    ],
                  ),
                );
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
