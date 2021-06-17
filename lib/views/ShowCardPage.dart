import 'package:adopt_ta_waifu/controller/constant/Colors.dart';
import 'package:adopt_ta_waifu/controller/constant/Icons.dart';
import 'package:adopt_ta_waifu/models/Waifu.dart';
import 'package:adopt_ta_waifu/widget/my_materials.dart';
import 'package:flutter/material.dart';

class ShowCardPage extends StatefulWidget {
  final String title;
  final List<Waifu> waifus;
  ShowCardPage(this.title, this.waifus);

  @override
  _ShowCardPageState createState() => _ShowCardPageState();
}

class _ShowCardPageState extends State<ShowCardPage> {
  //variable
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var heightTotal = MediaQuery.of(context).size.height;
    var widthTotal = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: MyAppBar(
        title: widget.title,
      ),
      body: _body(
        heightTotal,
        widthTotal,
      ),
    );
  }

  Widget _body(double heightTotal, double widthTotal) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          imgCard(heightTotal, widthTotal),
          _rowButton(),
        ],
      ),
    );
  }

  Widget imgCard(double heightTotal, double widthTotal) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Image.network(
        widget.waifus[index].previewImg,
        fit: BoxFit.fill,
        width: widthTotal * 0.8,
        height: heightTotal * 0.5,
      ),
    );
  }

  Widget _rowButton() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        iconButtonCustom(
          isLike: true,
          callback: () {},
        ),
        iconButtonCustom(
          isLike: false,
          callback: () => _nextPage(),
        ),
      ],
    );
  }

  Widget iconButtonCustom(
      {required bool isLike, required VoidCallback callback}) {
    return IconButton(
      onPressed: callback,
      icon: isLike ? Icon(likeIcon) : Icon(dislikeIcon),
      iconSize: 44.0,
      color: blueMain,
    );
  }

  void _nextPage() {
    if (index < (widget.waifus.length - 1)) {
      ++index;
      setState(() {});
    } else {
      // TODO if all img show!
      index = 0;
    }
  }
}
