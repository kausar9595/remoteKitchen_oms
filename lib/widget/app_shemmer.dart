import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final double width;
  final double height;
  const AppShimmer({super.key, this.width = 100, this.height = 20});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child:Container(color: Colors.white, width: width, height: height,),
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.white
    );
  }
}
