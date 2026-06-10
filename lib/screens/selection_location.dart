import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar/root.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_text.dart';

class SelectionLocation extends StatefulWidget {
  const SelectionLocation({super.key});

  @override
  State<SelectionLocation> createState() => _SelectionLocationState();
}

class _SelectionLocationState extends State<SelectionLocation> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController zonecontroller = TextEditingController();
  List<String> zones = [
    "Cairo",
    "Alexandria",
    "Port Saied",
    "Ismailia",
    "Suez",
    "Tanta",
    "Menofia",
    "Banha",
    "Luxor",
    "Aswan",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Gap(120),
            Image.asset(
              "assets/logo/illustration.png",
              width: 220,
              height: 170,
            ),
            Gap(30),
            CustomText(text: "Select Your Location", color: Color(0xff181725)),
            Column(
              children: [
                CustomText(
                  text:
                  "Switch on your location to stay in tune with",
                  color: Color(0xff7C7C7C),
                ),
                CustomText(
                  text:
                  "what’s happening in your area",
                  color: Color(0xff7C7C7C),
                ),
              ],
            ),

            Gap(80),
            Form(
              key: formkey,
              child: TextFormField(
                controller: zonecontroller,
                readOnly: true,
                onTap: () async {
                  final selected = await showModalBottomSheet<String>(
                    context: context,
                    builder: (_) {
                      return ListView.builder(
                        itemCount: zones.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(zones[index]),
                            onTap: () {
                              Navigator.pop(context, zones[index]);
                            },
                          );
                        },
                      );
                    },
                  );
                  if (selected != null) {
                    setState(() {
                      zonecontroller.text = selected;
                    });
                  }
                },
                decoration: InputDecoration(
                  label: CustomText(
                    text: "Your Zone",
                    color: Color(0xff7C7C7C),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            Gap(60),
            CustomButton(
              title: "Submit",
              onTap: () {
                if (zonecontroller.text.isNotEmpty) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (c) => Root(initialPage: 0, zone: zonecontroller.text),
                    ),
                  );
                }
              },
              color: Color(0xff53B175),
              svgs: false,
              svg: "",
              fontcolor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
