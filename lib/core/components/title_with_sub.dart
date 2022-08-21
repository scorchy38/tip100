import 'package:flutter/material.dart';

class TitleWithSub extends StatelessWidget {
  const TitleWithSub({
    Key? key,
    required this.title,
    required this.sub,
  }) : super(key: key);

  final String title;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title ',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          '($sub)',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
