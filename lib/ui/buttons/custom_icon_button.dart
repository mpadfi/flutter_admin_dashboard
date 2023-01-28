import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  //
  final Function onPressed;
  final String text;
  final Color color;
  final bool filled;
  final IconData icon;
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = const Color(0xff624ef2),
    this.filled = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: color,
      ),
      onPressed: () => onPressed(),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 4),
          Text(text, style: CustomLabels.p.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
