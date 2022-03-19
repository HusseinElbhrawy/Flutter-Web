import 'package:flutter/material.dart';

import 'appbar_title.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  const TopBarContents(this.opacity, {Key? key}) : super(key: key);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 70),
      child: Container(
        color: Colors.white.withOpacity(widget.opacity.clamp(0, 1).toDouble()),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width / 4,
                    ),
                    const AppBarTitle(),
                    // SizedBox(width: screenSize.width / 15),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ...List.generate(
                              4,
                              (index) => InkWell(
                                    onHover: (value) {
                                      setState(() {
                                        value
                                            ? _isHovering[index] = true
                                            : _isHovering[index] = false;
                                      });
                                    },
                                    onTap: () {},
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // SizedBox(width: screenSize.width / 15),
                                        Text(
                                          index == 0
                                              ? 'Home'
                                              : index == 1
                                                  ? ' About'
                                                  : index == 2
                                                      ? 'History'
                                                      : 'Contact',
                                          style: TextStyle(
                                            color: _isHovering[index]
                                                ? const Color(0xFF077bd7)
                                                : const Color(0xFF077bd7),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Visibility(
                                          maintainAnimation: true,
                                          maintainState: true,
                                          maintainSize: true,
                                          visible: _isHovering[index],
                                          child: Container(
                                            height: 2,
                                            width: 20,
                                            color: const Color(0xFF051441),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                      ],
                                    ),
                                  )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
