import 'package:flutter/material.dart';
import 'package:name_generator/screens/home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  //this controls the opacity of widgets
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    //start the animation when the widgets is initialized
    _startAnimation();
  }

  void _startAnimation() {
    //delay the animation by 700 milliseconds
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        //changes the opacity to 1 to make widgets visible.
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff09203F), Color(0xff537895)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //AnimatedOpacity for the text widget.
                AnimatedOpacity(
                  //controls the opacity using the state variable.
                  opacity: _opacity,

                  //duration of the animation.
                  duration: const Duration(seconds: 5),
                ),
                //heading
                const Text(
                  textAlign: TextAlign.center,
                  "Need a fresh name? \nWe've got you covered.",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //spacer
                const SizedBox(
                  height: 80,
                ),

                //AnimatedOpacity for the Button.
                AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(seconds: 5),
                ),
                //lets begin button
                ElevatedButton(
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                    ),
                    foregroundColor: WidgetStatePropertyAll(Colors.black),
                    elevation: WidgetStatePropertyAll(5),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                  ),

                  //when pressed, user go to the homepage.
                  onPressed: () {
                    //will replace the welcome page to home page,
                    //hiding the back button from appbar.
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        //duration of the animation
                        transitionDuration: const Duration(milliseconds: 700),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const HomePage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          //customize the transition animation.

                          //start position(off-screen right)
                          var begin = const Offset(1.0, 0.0);

                          //end position(on-screen centre)
                          var end = Offset.zero;

                          //animation curve for smooth effect.
                          var curve = Curves.easeInOut;

                          //controls the start and end position and animation curve
                          var tween = Tween(begin: begin, end: end).chain(
                            CurveTween(curve: curve),
                          );

                          var offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: const Text("Lets Begin"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
