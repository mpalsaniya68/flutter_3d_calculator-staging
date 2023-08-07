import 'package:calculator_3d/drawing/key_body_painter.dart';
import 'package:calculator_3d/utils/calculator_config.dart';
import 'package:calculator_3d/utils/calculator_key_data.dart';
import 'package:calculator_3d/widgets/calculator_key_face.dart';
import 'package:flutter/material.dart';

class CalculatorKey extends StatelessWidget {
  const CalculatorKey({
    super.key,
    required this.keyData,
    required this.animationController,
    required this.calculatorConfig,
    required this.glowOffsetAnimation,
  });

  final CalculatorKeyData keyData;
  final AnimationController animationController;
  final CalculatorConfig calculatorConfig;
  final Animation<Offset> glowOffsetAnimation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: keyData.size.width,
      height: keyData.size.height,
      child: Stack(
        children: [
          CustomPaint(
            painter: KeyBodyPainter(
              keySize: keyData.size,
              config: calculatorConfig,
              animation: animationController,
              color: keyData.color,
            ),
          ),
          CalculatorKeyFace(
            size: keyData.size,
            value: keyData.value,
            config: calculatorConfig,
            color: keyData.color,
            animationController: animationController,
            glowOffsetAnimation: glowOffsetAnimation,
          ),
        ],
      ),
    );
  }
}
