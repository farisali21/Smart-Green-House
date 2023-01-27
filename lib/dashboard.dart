import 'package:dashboard_gh/login_screen.dart';
import 'package:dashboard_gh/power_Bi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';

import 'application_information.dart';

final Color backgroundColor = Color(0xFF2d2d39);

class TransactionDetails {
  final String AirQuality;
  final String Brightness;
  final String Humidity;
  final String Moisture;
  final String Tempreture;
  final String TimeStamp;

  TransactionDetails({
    required this.AirQuality,
    required this.Brightness,
    required this.Humidity,
    required this.Moisture,
    required this.Tempreture,
    required this.TimeStamp,
  });
}

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  List listOfData = [];

  bool isCollapsed = true;
  double? screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 200);
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;
  Animation<double>? _menuScaleAnimation;
  Animation<Offset>? _slideAnimation;

  double mainBorderRadius = 0;
  Brightness statusIconColor = Brightness.dark;


  void updateStarCount(data) {
    data.forEach((key, value) {
      setState(() {
        listOfData.add(value);
        listOfData.isNotEmpty
            ? listOfData
                .sort((a, b) => a['TimeStamp'].compareTo(b['TimeStamp']))
            : '';
      });
    });
  }

  @override
  void initState() {
    super.initState();
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref();
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;
      updateStarCount(data);
    });
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller!);
    _menuScaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(_controller!);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Widget transactionList(
    String strDate, {
    bool lastElement: false,
  }) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Container(
          child: Text(
            '$strDate',
            style: TextStyle(
              color: Color(0xffadb2be),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.fromLTRB(5, 10, 5, (lastElement) ? 40 : 5),
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                  )
                ],
              ),
              // padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AirQuality: ${listOfData[index]['AirQuality'].toString().substring(0, listOfData[index]['AirQuality'] > 6 ? 7 : listOfData[index]['AirQuality'])}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Brightness: ${listOfData[index]['Brightness'].toString()}', //.substring(0,5)
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Humidity: ${listOfData[index]['Humidity'].toString()}', //.substring(0,5)
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Moisture: ${listOfData[index]['Moisture'].toString()}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Temp: ${listOfData[index]['Tempreture'].toString()}', //.substring(0,5)
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'TS: ${listOfData[index]['TimeStamp'].toString()}', //.substring(0,5)
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: listOfData.length,
        ),
      ],
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.5 * screenWidth!,
      width: screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation!,
        child: Material(
          borderRadius: BorderRadius.circular(mainBorderRadius),
          animationDuration: duration,
          color: Color(0xfff4faff),
          child: SafeArea(
              child: listOfData.isEmpty
                  ? Center(
                      child: Text('waiting data'),
                    )
                  : Stack(
                      children: <Widget>[
                        ListView(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff30825C),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
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
                                          onPressed: () {
                                            setState(() {
                                              if (isCollapsed) {
                                                mainBorderRadius = 30;
                                                statusIconColor =
                                                    Brightness.light;
                                                _controller?.forward();
                                              } else {
                                                _controller?.reverse();
                                                mainBorderRadius = 0;
                                                statusIconColor =
                                                    Brightness.dark;
                                              }
                                              isCollapsed = !isCollapsed;
                                            });
                                          },
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
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: ListView(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                children: <Widget>[
                                  SizedBox(height: 15),
                                  Container(
                                    padding: EdgeInsets.only(
                                      bottom: 16,
                                      left: 16,
                                      right: 16,
                                    ),
                                    child: ListView(
                                      physics: ClampingScrollPhysics(),
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "DATA",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.settings,
                                                color: Color(0xffa4a6b8),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                        transactionList('Today'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // bottomBar(),
                        ///bottom bar comment if we need to use it
                      ],
                    )),
        ),
      ),
    );
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

  Widget menu(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 40),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              MenuDashboardPage(),
                        ),
                      );
                    },
                    child: menuItem(
                      title: "Home",
                      iconData: Icons.account_balance_wallet,
                      active: true,
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              PowerBI(),
                        ),
                      );
                    },
                    child: menuItem(
                      title: "Power BI",
                      iconData: Icons.chat_bubble_outline,
                      active: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ApplicationInformation(),
                        ),
                      );
                    },
                    child: menuItem(
                      title: "Info",
                      iconData: Icons.chat_bubble_outline,
                      active: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginScreen(),
                  ),
                );
              },
              child: menuItem(
                title: "Logout",
                iconData: Icons.exit_to_app,
                active: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: statusIconColor,
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xff30825C),
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }
}
