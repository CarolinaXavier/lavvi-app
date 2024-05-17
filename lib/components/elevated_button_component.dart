import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final String label;
  final Widget? child;
  final Color? color;
  final Function()? onPressed;
  const ElevatedButtonComponent({super.key, required this.label, this.color, required this.onPressed, this.child});

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
      child: child ?? Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w300,
          letterSpacing: 4,
          color: Colors.white,
          
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
