import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isfillSan = false;
  Duration duration = const Duration(seconds: 3);
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
      const Color(0xff922a7f),
      const Color(0xffCE577D),
      const Color(0xffff9484),
      if (isfillSan) const Color(0xffff9080),
    ];
    var darkBgColor = [
      const Color(0xff0f1746),
      const Color(0xff263280),
      const Color(0xff33519A),
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
              margin: const EdgeInsets.fromLTRB(20, 100, 20, 0),
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10)),
              child: DefaultTabController(
                length: 2,
                child: TabBar(
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                    labelStyle:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tabs: const [
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
