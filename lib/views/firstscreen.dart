import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tasks_app/Tasklist.dart';

class Firstscreeen extends StatelessWidget {
  const Firstscreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: LottieBuilder.asset("assets/ani_1.json"))),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Manage your tasks \nefficiently.",
              style: GoogleFonts.nunito(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Save your time.",
              style: GoogleFonts.nunito(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              height: 50,
              onPressed: () {
                Get.off(()=>Homepage(),transition: Transition.cupertino);
                
              },
              child: Row(
                children: [
                  Text(
                    'Get Started now',
                    style:
                        GoogleFonts.nunito(color: Colors.white, fontSize: 20),
                  ),
                  PhosphorIcon(
                    PhosphorIcons.bold.caretRight,
                    color: Colors.white,
                  )
                ],
              ),
              color: Colors.pink,
            ),
          ),
        ],
      )),
      backgroundColor: Colors.black,
    );
  }
}
