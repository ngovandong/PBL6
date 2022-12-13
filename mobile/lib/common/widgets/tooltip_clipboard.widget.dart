import 'package:flutter/material.dart';

class TooltipClipboard extends StatelessWidget {
  final Widget child;
  final String message;
  final String copiedText;

  const TooltipClipboard({
    super.key,
    required this.child,
    required this.message,
    required this.copiedText,
  });

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return const SizedBox();
    // return Tooltip(
    //   key: key,
    //   message: message,
    //   textStyle: AppStyles.caption1Regular(context)
    //       .copyWith(color: AppColors.kPrimaryColor1),
    //   showDuration: const Duration(milliseconds: 1000),
    //   waitDuration: const Duration(milliseconds: 1000),
    //   preferBelow: false,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(99),
    //     color: AppColors.kNeutral8,
    //     boxShadow: [
    //       BoxShadow(
    //         color: AppColors.kNeutral8.withOpacity(0.3),
    //         spreadRadius: 1,
    //         blurRadius: 1,
    //         offset: const Offset(0, 1),
    //       )
    //     ],
    //   ),
    //   child: GestureDetector(
    //     behavior: HitTestBehavior.opaque,
    //     onTap: () => _onTap(key),
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: child,
    //     ),
    //   ),
    // );
  }
}
