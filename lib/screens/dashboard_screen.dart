import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ioe_health/constants.dart';
import 'package:ioe_health/screens/steps_widget.dart';

import 'next_page_live.dart';
import 'next_page_visual.dart';

class dashboard_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _dashboard_screen_state();
  }
}

class _dashboard_screen_state extends State<dashboard_screen> {
  List<Widget> Containers = [
    Container(
      color: kinput_foreground_color,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
        children: [
          steps_widget(),
          Expanded(
            child: Reusable_card(
              title: "Heart Rate",
              next_page_title: "Heart Rate Live Data",
              link_for_webview: "images/pulse_live.png",
              data: "Click to View Data",
              fontsize: 15,
              img: AssetImage("images/heart_pulse.png"),
              width: 10,
            ),
          ),
          Expanded(
            child: Reusable_card(
              title: "Oxygen",
              next_page_title: "Oxygen Live Data",
              link_for_webview: "images/oxygen_live.png",
              data: "Click to View Data",
              fontsize: 15,
              img: AssetImage("images/o2_icon.png"),
              width: 30,
            ),
          ),
          Expanded(
            child: Reusable_card(
              title: "Temp",
              next_page_title: "Temperature Live Data",
              link_for_webview: "images/temp_live.png",
              data: "Click to View Data",
              fontsize: 15,
              img: AssetImage("images/temp_icon.png"),
              width: 50,
            ),
          ),
          Expanded(
            child: Reusable_card(
              title: "Sleep",
              fontsize: 15,
              next_page_title: "Sleep Live Data",
              link_for_webview: "images/sleep_live.png",
              data: "Click to View Data",
              img: AssetImage("images/sleep_icon.png"),
              width: 50,
            ),
          )
        ],
      ),
    ),
    Container(
      color: kbackground_color,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
        children: [
          white_card(
            title: "Steps Analysis",
            next_page_title: "Steps Analysis",
            link_for_webview:
                'https://public.tableau.com/app/profile/avantika.tiwari/viz/IOE_Steps/Dashboard1?publish=yes',
            img: AssetImage("images/walk.png"),
          ),
          white_card(
            title: "Heart Analysis",
            next_page_title: "Heart Analysis",
            link_for_webview:
                'https://public.tableau.com/app/profile/avantika.tiwari/viz/IOE_HeartRate/Dashboard1?publish=yes',
            img: AssetImage("images/heart.png"),
          ),
          white_card(
            title: "OxygenRate Data",
            link_for_webview:
                'https://public.tableau.com/app/profile/avantika.tiwari/viz/IOE_Spo2/Dashboard1?publish=yes',
            next_page_title: "OxygenRate Analysis",
            img: AssetImage("images/oxygen.png"),
          ),
          white_card(
            title: "Temperature Data",
            next_page_title: "Temperature Analysis",
            link_for_webview:
                'https://public.tableau.com/app/profile/avantika.tiwari/viz/IOE_Temperature/Dashboard1?publish=yes',
            img: AssetImage("images/temperature.png"),
          ),
          white_card(
            title: "Sleep Analysis",
            next_page_title: "Sleep Analysis",
            link_for_webview:
                'https://public.tableau.com/app/profile/avantika.tiwari/viz/IOE_Sleep/Dashboard1?publish=yes',
            img: AssetImage("images/sleep.png"),
          )
        ],
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kbackground_color,
          elevation: 0,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Live Data",
                icon: Icon(
                  Icons.live_tv_rounded,
                  color: ktext_color,
                ),
              ),
              Tab(
                text: "Data Visuals",
                icon: Icon(
                  Icons.auto_graph_rounded,
                  color: ktext_color,
                ),
              )
            ],
          ),
        ),
        body: TabBarView(children: Containers),
      ),
    );
  }
}

class white_card extends StatelessWidget {
  white_card(
      {required this.title,
      required this.img,
      required this.next_page_title,
      required this.link_for_webview});
  String title;
  AssetImage img;
  String link_for_webview;
  String next_page_title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => next_page_visual(
                    title: next_page_title,
                    link: link_for_webview,
                  )),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          children: [
            Image(
              image: img,
              height: 140,
              width: 140,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18.0,
                  color: kinput_text_color,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class Reusable_card extends StatelessWidget {
  Reusable_card(
      {required this.title,
      required this.data,
      required this.next_page_title,
      required this.link_for_webview,
      required this.img,
      required this.width,
      required this.fontsize});
  String title;
  String data;
  String link_for_webview;
  String next_page_title;
  AssetImage img;
  double width;
  double fontsize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => next_page_live(
                    title: next_page_title,
                    link: link_for_webview,
                  )),
        );
      },
      child: Container(
        height: 200,
        width: 170,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: kbackground_color, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white70),
                    ),
                    SizedBox(width: width),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image(
                        image: img,
                        height: 35,
                        width: 35,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: ktext_color,
                ),
                Text(
                  data,
                  style:
                      TextStyle(fontSize: fontsize, color: kinput_text_color),
                ),
              ]),
        ),
      ),
    );
  }
}