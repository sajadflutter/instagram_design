import 'package:flutter/material.dart';
import 'package:instagram/constant/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode myfocusnode1 = FocusNode();
  FocusNode myfocusnode2 = FocusNode();
  bool typing = true;
  @override
  void initState() {
    super.initState();

    myfocusnode1.addListener(() {
      setState(() {});
    });
    myfocusnode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff4E3CC9),
            Color(0xffF35383),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                _getImageContainerBox(),
                _getContainerBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getContainerBox() {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff1C1F2E),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: _getTextFileds(),
          ),
        ),
      ],
    );
  }

  Widget _getImageContainerBox() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 40,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Image.asset('images/rocket.png'),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget _getTextFileds() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign in to ',
                style: TextStyle(
                  fontSize: 20,
                  color: white,
                ),
              ),
              Image.asset('images/mood.png'),
            ],
          ),
          SizedBox(
            height: 34,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44),
            child: TextField(
              focusNode: myfocusnode1,
              style: TextStyle(
                color: white,
                fontSize: 14,
                fontFamily: 'GB',
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                labelText: 'Email',
                labelStyle: TextStyle(
                    color: myfocusnode1.hasFocus ? pink : white,
                    fontSize: 14,
                    fontFamily: 'GB'),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(
                    color: grey,
                    width: 3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(
                    color: pink,
                    width: 3,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 34,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44),
            child: TextField(
              focusNode: myfocusnode2,
              style: TextStyle(color: white, fontSize: 14, fontFamily: 'GB'),
              obscureText: typing,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: myfocusnode2.hasFocus ? pink : white,
                    fontSize: 14,
                    fontFamily: 'GB'),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(
                    color: white,
                    width: 3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(
                    color: pink,
                    width: 3,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          SizedBox(
            width: 129,
            height: 46,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'sign in',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don’t have an account? / ',
                style: TextStyle(
                  fontFamily: 'GB',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Sign up',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    myfocusnode1.dispose();
    myfocusnode2.dispose();

    super.dispose();
  }
}
