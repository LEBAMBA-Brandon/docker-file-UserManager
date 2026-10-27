import 'package:flutter/material.dart';

class MyCardForm extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double padding;
  final Color? color;

  const MyCardForm({
    super.key,
    required this.child,
    this.onTap,
    this.padding = 16.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Padding(padding: EdgeInsetsGeometry.all(padding), child: child),
      ),
    );
  }
}
