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
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.giant),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sushi Man",
                      style: GoogleFonts.dmSerifDisplay(
                          color: Colors.white, fontSize: Sizes.extraLarge * 2)),
                  Image.asset("lib/images/sushi-type-1.png"),
                  Text("THE TAST OF JAPANESE FOOD",
                      style: GoogleFonts.dmSerifDisplay(
                          color: Colors.white, fontSize: Sizes.giant * 1.8)),
                  Text(
                    "Feel the taste of the most popular Japanese food from anywhere and anytime.",
                    style:
                        TextStyle(height: Sizes.tiny, color: Colors.grey[300]),
                  ),
                  SizedBox(
                    height: Sizes.giant * 3,
                    child: FilledButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, "/menuPage"),
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromARGB(109, 140, 94, 91))),
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
    );
  }
}
