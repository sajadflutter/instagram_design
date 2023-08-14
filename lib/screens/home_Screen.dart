import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram/constant/color.dart';
import 'package:instagram/screens/share_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset(
            'images/moodinger_logo.png',
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 17),
            child: Container(
              width: 24,
              height: 24,
              child: Image.asset('images/icon_direct.png'),
            ),
          ),
        ],
      ),
      backgroundColor: greybackground,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: getbottomsheet(context),
            ),
            SliverToBoxAdapter(
              child: getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 34,
                    ),
                    _getPostHeader(),
                    SizedBox(
                      height: 25,
                    ),
                    _getPostContent(),
                  ],
                );
              }, childCount: 4),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton getbottomsheet(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            barrierColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: DraggableScrollableSheet(
                  initialChildSize: 0.4,
                  minChildSize: 0.2,
                  maxChildSize: 0.7,
                  builder: (context, Controller) => ShareBottomSheet(
                    Controller: Controller,
                  ),
                ),
              );
            });
      },
      child: Text('open bottom sheet'),
    );
  }

  Container getStoryList() {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return index == 0 ? _getAddStoryBox() : _getStoryListBox();
        },
      ),
    );
  }
}

Widget _getPostContent() {
  return Container(
    width: 394,
    height: 440,
    child: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Positioned(
          top: 0,
          child: ClipRRect(
            child: Image.asset('images/post_cover.png'),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          top: 15,
          right: 15,
          child: Image.asset('images/icon_video.png'),
        ),
        Positioned(
          bottom: 13,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                width: 340,
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.4),
                      Color.fromRGBO(255, 255, 255, 0.2),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Image.asset('images/icon_hart.png'),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '2.6 K',
                            style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 14,
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('images/icon_comments.png'),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '1.5 K',
                            style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 14,
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset('images/icon_share.png'),
                    Image.asset('images/icon_save.png'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _getPostHeader() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 18),
    child: Row(
      children: [
        _getStoryBox(),
        Padding(
          padding: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'amirahmadadibii',
                style: TextStyle(color: white, fontFamily: 'GB', fontSize: 12),
              ),
              Text(
                'امیراحمد برنامه‌نویس موبایل',
                style: TextStyle(color: white, fontFamily: 'SM', fontSize: 12),
              ),
            ],
          ),
        ),
        Spacer(),
        Image.asset('images/icon_menu.png'),
      ],
    ),
  );
}

Widget _getStoryBox() {
  return Container(
    child: DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      padding: EdgeInsets.all(4),
      color: pink,
      strokeWidth: 2,
      dashPattern: [40, 10],
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        child: Container(
          child: Image.asset(
            'images/profile.png',
            width: 38,
            height: 38,
          ),
        ),
      ),
    ),
  );
}

Widget _getStoryListBox() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    child: Column(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12),
          padding: EdgeInsets.all(4),
          color: pink,
          strokeWidth: 2,
          dashPattern: [40, 10],
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            child: Container(
              height: 58,
              width: 58,
              child: Image.asset('images/profile.png'),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'test',
          style: TextStyle(color: white),
        ),
      ],
    ),
  );
}

Widget _getAddStoryBox() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    child: Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: greybackground,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2),
              ),
              child: Center(
                child: Image.asset('images/icon_plus.png'),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'your story',
          style: TextStyle(color: white),
        )
      ],
    ),
  );
}
