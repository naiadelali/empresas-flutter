import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IoasysWidget extends StatelessWidget {
  final double size;

  const IoasysWidget({Key? key, this.size = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.string(
          '''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="320" height="150" viewBox="0 0 320 150">
                  <image id="Camada_1" data-name="Camada 1" y="37" width="320" height="82" xlink:href="data:img/png;base64,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"/>
                </svg>
            '''),
      height: size,
    );
  }
}
