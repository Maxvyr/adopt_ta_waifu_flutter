import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

/// A helper class if you want a FloatingActionButton to be pinned in the FlexibleAppBar
class MySliverFab extends StatefulWidget {
  ///List of slivers placed in CustomScrollView
  final List<Widget> slivers;

  ///FloatingActionButton placed on the edge of FlexibleAppBar and rest of view
  final Widget floatingWidget;

  ///Expanded height of FlexibleAppBar
  final double expandedHeight;

  ///Number of pixels from top from which the [floatingWidget] should start shrinking.
  ///E.g. If your SliverAppBar is pinned, I would recommend this leaving as default 96.0
  ///     If you want [floatingActionButton] to shrink earlier, increase the value.
  final double topScalingEdge;

  ///Position of the widget.
  final MyFloatingPosition floatingPosition;

  final VoidCallback scrollcallback;
  final String title;

  MySliverFab({
    required this.slivers,
    required this.floatingWidget,
    required this.scrollcallback,
    required this.title,
    this.floatingPosition = const MyFloatingPosition(
      top: 0,
      right: 16.0,
      left: 0,
    ),
    this.expandedHeight = 256.0,
    this.topScalingEdge = 96.0,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new MySliverFabState();
  }
}

class MySliverFabState extends State<MySliverFab> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(
      () => setState(() {
        widget.scrollcallback();
      }),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          controller: scrollController,
          slivers: widget.slivers,
        ),
        _buildTitle(),
        _buildFab(),
      ],
    );
  }

  Widget _buildTitle() {
    if (widget.title.isEmpty) {
      return SizedBox();
    }

    final double defaultFabSize = 56.0;
    final double paddingTop = MediaQuery.of(context).padding.top;
    final defaultBottomMargin = 17.5;
//    final double mileuVertical = (widget.expandedHeight  - defaultFabSize)/ 2.0;
    final double mileuVertical = (widget.expandedHeight - 30) / 2.0;

    var marginTopTitre = mileuVertical + defaultBottomMargin + paddingTop;
    double scale = 1.30;
    if (scrollController.hasClients) {
      final expanded2 = widget.expandedHeight - defaultFabSize;

      final percent = max(0.0, 1.0 - (scrollController.offset / expanded2));
//      marginTopTitre = mileuVertical * percent + defaultBottomMargin + defaultFabSize;
      marginTopTitre =
          mileuVertical * percent + defaultBottomMargin + paddingTop;
      scale = Tween(begin: 1.0, end: 1.30).transform(percent);
    }

//    print("marginTopTitre=$marginTopTitre  defaultFabSize ${defaultFabSize}   paddingTop=${paddingTop}   mileuVertical=$mileuVertical");

    return Positioned(
      top: marginTopTitre,
      right: 0,
      left: 0,
      child: Transform.scale(
        scale: scale,
        child: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildFab() {
    final double defaultFabSize = 56.0;
    final double paddingTop = MediaQuery.of(context).padding.top;
    final double defaultTopMargin = widget.expandedHeight +
        paddingTop +
        widget.floatingPosition.top -
        defaultFabSize / 2;

    final double scale0edge = widget.expandedHeight - kToolbarHeight;
    final double scale1edge = defaultTopMargin - widget.topScalingEdge;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (scrollController.hasClients) {
      double offset = scrollController.offset;
      top -= offset > 0 ? offset : 0;
      if (offset < scale1edge) {
        scale = 1.0;
      } else if (offset > scale0edge) {
        scale = 0.0;
      } else {
        scale = (scale0edge - offset) / (scale0edge - scale1edge);
      }
    }

    return Positioned(
      top: top,
      right: widget.floatingPosition.right,
      left: widget.floatingPosition.left,
      child: new Transform(
        transform: new Matrix4.identity()..scale(scale, scale),
        alignment: Alignment.center,
        child: widget.floatingWidget,
      ),
    );
  }
}

///A class representing position of the widget.
///At least one value should be not null
class MyFloatingPosition {
  ///Can be negative. Represents how much should you change the default position.
  ///E.g. if your widget is bigger than normal [FloatingActionButton] by 20 pixels,
  ///you can set it to -10 to make it stick to the edge
  final double top;

  ///Margin from the right. Should be positive.
  ///The widget will stretch if both [right] and [left] are not nulls.
  final double right;

  ///Margin from the left. Should be positive.
  ///The widget will stretch if both [right] and [left] are not nulls.
  final double left;

  const MyFloatingPosition({
    required this.top,
    required this.right,
    required this.left,
  });
}
