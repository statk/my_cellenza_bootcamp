import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetPage extends StatelessWidget {
  final Widget? _widget;
  final AppBar? _appBar;
  const WidgetPage({Key? key, AppBar? appBar, Widget? widget})
      : _widget = widget,
        _appBar = appBar,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.transparent,
        // Status bar brightness for Android (dark icons)
        statusBarIconBrightness:
            (Theme.of(context).brightness == Brightness.light) ? Brightness.dark : Brightness.light,
        // Status bar brightness for iOS (dark icons)
        statusBarBrightness: (Theme.of(context).brightness == Brightness.light) ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
        appBar: _appBar,
        body: _widget,
      ),
    );
  }
}
