import 'package:flutter/cupertino.dart';

import '../utils/dimentions.dart';


class Bigtext extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  Bigtext(
      {Key? key,
      this.color = const Color(0xFF212121),
      required this.text,
      this.size = 0,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontWeight: FontWeight.w400),
    );
  }
}
