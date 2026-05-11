import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  Size get size => mq.size;
  double get width => size.width;
  double get height => size.height;
  EdgeInsets get padding => mq.padding;
  EdgeInsets get viewPadding => mq.viewPadding;
  EdgeInsets get viewInsets => mq.viewInsets;
}
