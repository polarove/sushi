import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/constants/size.dart';
import 'package:sushi/constants/theme.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.giant),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sushi Man",
                          style: GoogleFonts.dmSerifDisplay(
                              color: Colors.white,
                              fontSize: Sizes.extraLarge * 2)),
                      Image.asset("lib/assets/images/sushi-type-1.png"),
                      Text("THE TAST OF JAPANESE FOOD",
                          style: GoogleFonts.dmSerifDisplay(
                              color: Colors.white,
                              fontSize: Sizes.giant * 1.8)),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: Sizes.medium),
                        child: Text(
                          "Feel the taste of the most popular Japanese food from anywhere and anytime.",
                          style: TextStyle(
                              height: Sizes.tiny, color: Colors.grey[300]),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: Sizes.medium),
                        height: Sizes.giant * 3,
                        child: FilledButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, "/menuPage"),
                            style: FilledButton.styleFrom(
                                backgroundColor: buttonColor),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Get Started"),
                                SizedBox(
                                  width: Sizes.large,
                                ),
                                Icon(Icons.arrow_forward)
                              ],
                            )),
                      )
                    ],
                  ))),
        ));
  }
}
