import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram/constant/color.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greybackground,
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pattern1.png'),
            opacity: 0.1,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('images/switch_account_background.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 220,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.5),
                                Color.fromRGBO(255, 255, 255, 0.2),
                              ],
                            ),
                          ),
                          width: 340,
                          height: 352,
                          child: Column(
                            children: [
                              SizedBox(height: 32),
                              Image.asset('images/profile.png'),
                              SizedBox(height: 20),
                              Text(
                                'Amirahmadadibi',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                height: 46,
                                width: 129,
                                child: ElevatedButton(
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style,
                                  onPressed: () {},
                                  child: Text(
                                    'Confirm',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'switch  account',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 63, top: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? /',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'GB',
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    ' Sign up',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
