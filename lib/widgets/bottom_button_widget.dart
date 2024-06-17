import 'package:flutter/material.dart';

class BottomButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool enabled;

  const BottomButtonWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: enabled ? onPressed : null,
      icon: Icon(icon),
      label: Text(title),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          enabled ? Theme.of(context).colorScheme.secondary : Colors.grey,
        ),
        foregroundColor: WidgetStateProperty.all(
          enabled ? Colors.black : Colors.grey[800],
        ),
        elevation: WidgetStateProperty.all(0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Bordas retangulares
          ),
        ),
      ),
    );
  }
}
