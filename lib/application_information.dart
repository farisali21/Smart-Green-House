import 'package:dashboard_gh/power_Bi.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'dashboard.dart';
import 'login_screen.dart';

class ApplicationInformation extends StatefulWidget {
  const ApplicationInformation({Key? key}) : super(key: key);

  @override
  State<ApplicationInformation> createState() => _ApplicationInformationState();
}

class _ApplicationInformationState extends State<ApplicationInformation> with TickerProviderStateMixin {

  bool isCollapsed = true;
  double? screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 200);
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;
  Animation<double>? _menuScaleAnimation;
  Animation<Offset>? _slideAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller!);
    _menuScaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(_controller!);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller!);
  }

  Widget menuItem({
    required IconData iconData,
    required String title,
    bool active: false,
  }) {
    return SizedBox(
      width: 0.5 * screenWidth!,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Icon(
                iconData,
                color: (active) ? Colors.white : Colors.grey,
                size: 22,
              ),
            ),
            Expanded(
              flex: 14,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  title,
                  style: TextStyle(
                    color: (active) ? Colors.white : Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.8;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xff30825C),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.drag_handle,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    ImageIcon(
                      AssetImage("assets/Simple-logo.png"),
                      color: Colors.white,
                      size: 36,
                    ),
                    Text(
                      'SmartGreenHouse',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                  ],
                ),
              ),
            ),
            Container(
                // width: c_width,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.textsms_rounded,
                          color: Color(0xff30825C),
                        ),
                        Flexible(
                          child: Text(
                            'smart greenhouse is a type of greenhouse that uses advanced technology to control the environment inside the greenhouse and optimize plant growth',
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans',
                                fontSize: 20
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(
                          Icons.textsms_rounded,
                          color: Color(0xff30825C),
                        ),
                        Flexible(
                          child: Text(
                            ' This can include sensors and automation systems to regulate temperature, humidity, light, and other factors that are important for plant growth',
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans',
                                fontSize: 20
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(
                          Icons.textsms_rounded,
                          color: Color(0xff30825C),
                        ),
                        Flexible(
                          child: Text(
                            'Smart greenhouses may also use renewable energy sources such as solar panels to power the systems, making them more environmentally friendly',
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans',
                                fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
