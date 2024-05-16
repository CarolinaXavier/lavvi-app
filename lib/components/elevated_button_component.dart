import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final String label;
  final Color? color;
  final Function()? onPressed;
  const ElevatedButtonComponent({super.key, required this.label, this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide.none,
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
         color ?? const Color.fromRGBO(14, 27, 43, 1),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          letterSpacing: 4,
          color: Colors.white,
        ),
      ),
    );
  }
}
