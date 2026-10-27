import 'package:flutter/material.dart';

class MyButtonForm extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isSecondary;
  final Size? minimumSize;

  const MyButtonForm({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isSecondary = false,
    this.minimumSize = const Size(double.minPositive, 30),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final backgroundColor = isSecondary
        ? theme.colorScheme.surface
        : theme.colorScheme.primary;
    final foregroundColor = isSecondary
        ? theme.colorScheme.primary
        : theme.colorScheme.surface;
    final border = isSecondary
        ? BorderSide(color: theme.colorScheme.primary)
        : BorderSide.none;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        side: border,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        minimumSize: minimumSize,
      ),
      onPressed: (isLoading || onPressed == null) ? null : onPressed,
      child: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: foregroundColor,
              ),
            )
          : Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
    );
  }
}
