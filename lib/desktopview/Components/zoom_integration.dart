import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ZoomIntegration extends StatelessWidget {
  String meetingNumber;
  String meetingPassword;
  String username;
  String zoomLink;
  ZoomIntegration(
      {this.meetingNumber, this.username, this.meetingPassword, this.zoomLink});

  @override
  Widget build(BuildContext context) {
    // String zoomLink =
    //     "https://brindakarthik.github.io/zoom/?meetingNumber=${meetingNumber}&username=abc&password=${meetingPassword}";
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: IframeScreen(500, 400, zoomLink),
    );
  }
}

class IframeScreen extends StatefulWidget {
  double w;
  double h;
  String src;

  IframeScreen(double _w, double _h, String _src) {
    this.w = _w;
    this.h = _h;
    this.src = _src;
  }

  @override
  _IframeScreenState createState() => _IframeScreenState(w, h, src);
}

class _IframeScreenState extends State<IframeScreen> {
  Widget _iframeWidget;
  final IFrameElement _iframeElement = IFrameElement();
  double _width;
  double _height;
  String _source;

  _IframeScreenState(double _w, double _h, String _src) {
    _width = _w;
    _height = _h;
    _source = _src;
  }

  @override
  void initState() {
    super.initState();
    _iframeElement.src = _source;
    _iframeElement.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
      child: _iframeWidget,
    );
  }
}
