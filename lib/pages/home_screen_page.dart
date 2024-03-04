// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_gpt_code/custom_text/heading.dart';

import '../custom_text/sub_heading1.dart';
import '../custom_text/sub_heading2.dart';
import 'login_page.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  Color clr = Colors.grey;



  List<SubHeading1> subHeading1 = [
    const SubHeading1(title: 'Donate Blood'),
    const SubHeading1(title: 'Receive Blood'),
    const SubHeading1(title: 'Heartbeat of Humanity'),
  ];
  List<SubHeading2> subHeading2 = [
    const SubHeading2(title: 'Sadaqah of Life'),
    const SubHeading2(title: 'Hopeful Healing'),
    const SubHeading2(title: 'Donating, Receiving, Thriving Together'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: IconButton(
        color: Colors.black54,
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
            return const LoginPage();
          },),);
        },
        iconSize: 35,
        icon: const Icon(Icons.double_arrow),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Heading(title: 'RedDonors'),
        ),
      ),
      backgroundColor: Colors.red.shade400,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          subHeading1[index],
                          const SizedBox(height: 10,),
                          subHeading2[index],
                        ],
                      ),
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          height: (index == indexDots) ? 25 : 10,
                          width: 10,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (index == indexDots)
                                ? Colors.white
                                : Colors.red.shade200,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.bloodtype_sharp,
                      color: Colors.white,
                      size: 200,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
