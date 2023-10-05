import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isfillSan = false;
  Duration duration = Duration(seconds: 3);

  @override
  void initState(){super.initState();
  changeMode();
  }
  Future <void> changeMode() async {
    await Future <void>.delayed(duration);
    setState(() {
      isfillSan = true;
    });
  }
  Widget build(BuildContext context) {
    List <Color> lightbgColor = [
      Color(0xff922A7f),
      Color(0xffCE577D),
      Color(0xffff9484),
      if(isfillSan) Color(0xffff9080),
    ];
    var darkbgColor = [
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
      gradient: LinearGradient(colors: isfillSan ? lightbgColor : darkbgColor,
      begin: Alignment.bottomLeft,
      ),
     ),
     child: Stack(
      children: [
       AnimatedPositioned(
        child: Image.asset('assets/land_tree_light.png',
        height: height * 0.7,
        width: width * 1,
        fit: BoxFit.fitHeight,
        ),
        left: 0,
        right: 0,
        bottom: -50,
        duration: duration,
       ), 
        AnimatedPositioned(
        child: SvgPicture.asset('assets/Sun.svg',
        height: height * 0.5,
        width: width * 1,
        fit: BoxFit.fitHeight,
        ),
        left: 100,
        right: -80,
        bottom: 360,
        duration: duration,
       ), 
      ],
     ),
    ),  
    );

  }
}