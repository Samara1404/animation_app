import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isfillSan = false;
  Duration duration = Duration(seconds: 3);
  @override
  void initState() {
    super.initState();
    changeMode(0);
  }

  Future<void> changeMode(int value) async {
    await Future<void>.delayed(duration);
    if (value == 0) {
      setState(() {
        isfillSan = true;
      });
    } else {
      setState(() {
        isfillSan = false;
      });
    }
  }

  Widget build(BuildContext context) {
    List<Color> lightBgColor = [
      Color(0xff922a7f),
      Color(0xffCE577D),
      Color(0xffff9484),
      if (isfillSan) Color(0xffff9080),
    ];
    var darkBgColor = [
      Color(0xff0f1746),
      Color(0xff263280),
      Color(0xff33519A),
    ];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: AnimatedContainer(
        duration: duration,
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isfillSan ? lightBgColor : darkBgColor,
            begin: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              child: SvgPicture.asset(
                'assets/Sun.svg',
                height: height * 0.5,
                width: width * 1,
                fit: BoxFit.fitHeight,
              ),
              left: 100,
              right: -80,
              bottom: isfillSan ? 390 : -80,
              duration: duration,
            ),
            AnimatedPositioned(
              duration: duration,
              child: Image.asset(
                'assets/land_tree_light.png',
                height: height * 0.7,
                width: width * 1,
                fit: BoxFit.fitHeight,
              ),
              left: 0,
              right: 0,
              bottom: -48,
              //duration: duration,
            ),
            Container(
              width: width * 0.8,
              height: 50,
              margin: EdgeInsets.fromLTRB(20, 100, 20, 0),
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10)),
              child: DefaultTabController(
                length: 2,
                child: TabBar(
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                    labelStyle: TextStyle(fontSize: 18),
                    tabs: [
                      Tab(text: 'Morning login'),
                      Tab(text: 'Night login'),
                    ],
                    onTap: (value) async {
                      await changeMode(value);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}