import 'package:flutter/material.dart';

class FilteroptionItem extends StatelessWidget {
  const FilteroptionItem({
    super.key,
    required this.filterOption,
    this.onPressed,
  });

  final String filterOption;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          filterOption,
          style: const TextStyle(
            fontFamily: 'Lato-Bold',
            fontSize: 16,
          ),
        ));
  }
}
