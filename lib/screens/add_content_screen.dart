import 'package:flutter/material.dart';
import 'package:instagram/constant/color.dart';

class AddContentScreen extends StatefulWidget {
  const AddContentScreen({super.key});

  @override
  State<AddContentScreen> createState() => _AddContentScreenState();
}

class _AddContentScreenState extends State<AddContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greybackground,
      body: SafeArea(
        child: getcontent(),
      ),
    );
  }

  Widget getcontent() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(top: 37, bottom: 25),
          sliver: SliverToBoxAdapter(
            child: _getHeaderSection(),
          ),
        ),
        SliverToBoxAdapter(
          child: _getSelectedImage(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: 9,
              (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit
                          .fill, //we can also use fittedbox widget and put in a cliprrect widget
                      image: AssetImage('images/item$index.png'),
                    ),
                  ),
                );
              },
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getSelectedImage() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
      height: 394,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset('images/item9.png'),
        ),
      ),
    );
  }

  Widget _getHeaderSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(
            'Post',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            width: 15,
          ),
          Image.asset(
            'images/icon_arrow_down.png',
          ),
          Spacer(),
          Text(
            'Next',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            width: 15,
          ),
          Image.asset(
            'images/icon_arrow_right_box.png',
          ),
        ],
      ),
    );
  }
}
