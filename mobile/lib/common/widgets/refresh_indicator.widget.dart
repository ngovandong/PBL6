import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshHeaderIndicator extends RefreshIndicator {
  const RefreshHeaderIndicator({super.key});

  @override
  double get height => 90;

  @override
  State<StatefulWidget> createState() {
    return RefreshHeaderIndicatorState();
  }
}

class RefreshHeaderIndicatorState
    extends RefreshIndicatorState<RefreshHeaderIndicator> {
  @override
  Widget buildContent(BuildContext context, RefreshStatus mode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: CupertinoActivityIndicator(
        animating: mode == RefreshStatus.refreshing,
      ),
    );
  }
}

class RefreshFooterIndicator extends LoadIndicator {
  const RefreshFooterIndicator({super.key});

  @override
  double get height => 90;

  @override
  LoadStyle get loadStyle => LoadStyle.ShowWhenLoading;

  @override
  State<StatefulWidget> createState() {
    return RefreshFooterIndicatorState();
  }
}

class RefreshFooterIndicatorState
    extends LoadIndicatorState<RefreshFooterIndicator> {
  @override
  Widget buildContent(BuildContext context, LoadStatus mode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: CupertinoActivityIndicator(
        animating: mode == LoadStatus.loading,
      ),
    );
  }
}
