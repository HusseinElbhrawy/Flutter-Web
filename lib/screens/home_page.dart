import 'package:flutter/material.dart';
import 'package:flutter_web/widgets/bottom_bar.dart';
import 'package:flutter_web/widgets/carousel.dart';
import 'package:flutter_web/widgets/featured_heading.dart';
import 'package:flutter_web/widgets/featured_tiles.dart';
import 'package:flutter_web/widgets/floating_quick_access_bar.dart';
import 'package:flutter_web/widgets/main_heading.dart';
import 'package:flutter_web/widgets/top_bar_contents.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _opacity = 0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _opacity = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: TopBarContents(_opacity),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: SizedBox(
                    height: screenSize.height * 0.65,
                    width: screenSize.width,
                    child: Image.asset(
                      'assets/images/background.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    FloatingQuickAccessBar(screenSize: screenSize),
                    FeaturedHeading(screenSize: screenSize),
                    FeaturedTiles(screenSize: screenSize),
                    MainHeading(screenSize: screenSize),
                    const MainCarousel(),
                    const BottomBar(),
                  ],
                ),
              ],
            ),
            // SizedBox(
            //   height: screenSize.height,
            // ),
          ],
        ),
      ),
    );
  }
}
