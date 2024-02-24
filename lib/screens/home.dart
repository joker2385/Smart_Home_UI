import 'package:flutter/material.dart';
import 'package:smart_home_ui/utils/smartdevices_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List mySmartDevices = [
    ["Smart Light", "assets/images/light-bulb.png", true],
    ["Smart AC", "assets/images/air-conditioner.png", false],
    ["Smart TV", "assets/images/smart-tv.png", false],
    ["Smart Fan", "assets/images/fan.png", false],
  ];

   void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    "https://github.com/mitchkoko/ModernSmartHomeUI/blob/main/lib/icons/menu.png?raw=true",
                    height: 45.0,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            
            Padding(
            padding:EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: const Column(children: [
              Text("Welcome Home,"),
              Text("JOKER",
              style: TextStyle(fontSize: 40),)
            ]
          ),
        ),

          const SizedBox(height: 20,),

          Expanded(
              child: GridView.builder(
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            )



          ],
        ),
      ),
    );
  }
}
