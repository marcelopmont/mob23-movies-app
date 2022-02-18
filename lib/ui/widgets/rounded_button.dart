import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/ui_constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed == null ? 0.4 : 1,
      child: InkWell(
        onTap: onPressed,
        child: Material(
          color: Theme.of(context).primaryColorLight,
          elevation: onPressed == null ? 0 : 4,
          borderRadius: const BorderRadius.all(Radius.circular(1000)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(text, style: kButtonText),
            ),
          ),
        ),
      ),
    );
  }
}