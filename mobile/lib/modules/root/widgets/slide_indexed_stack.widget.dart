import 'package:flutter/material.dart';
import 'package:mobile/modules/root/widgets/lazy_indexed_stack.widget.dart';

class SlideIndexedStack extends StatefulWidget {
  final int index;
  final double slideOffset;
  final List<Widget> children;
  final Duration duration;

  const SlideIndexedStack({
    Key? key,
    required this.index,
    this.slideOffset = 0.2,
    required this.children,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  @override
  State<SlideIndexedStack> createState() => _SlideIndexedStackState();
}

class _SlideIndexedStackState extends State<SlideIndexedStack>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<Offset> _slideRTL;
  late final Animation<Offset> _slideLTR;

  bool _isRTL = true;

  Animation<Offset> _getAnimationIn() {
    return Tween(begin: Offset(widget.slideOffset, 0), end: Offset.zero)
        .animate(_animationController);
  }

  Animation<Offset> _getAnimationOut() {
    return Tween(begin: Offset(-widget.slideOffset, 0), end: Offset.zero)
        .animate(_animationController);
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _slideRTL = _getAnimationIn();
    _slideLTR = _getAnimationOut();
    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant SlideIndexedStack oldWidget) {
    if (widget.index != oldWidget.index) {
      bool checkRTL = false;
      if (widget.index > oldWidget.index) {
        checkRTL = true;
      }
      setState(() {
        _isRTL = checkRTL;
      });
      _animationController.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: _isRTL ? _slideRTL : _slideLTR,
          child: child,
        );
      },
      child: LazyIndexedStack(
        index: widget.index,
        children: widget.children,
      ),
    );
  }
}
