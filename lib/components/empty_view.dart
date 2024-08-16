import 'package:flutter/material.dart';
import 'package:sushi/constants/size.dart';
import './svg_icons.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key, this.description = "No data"});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Svg.empty,
          size: 120,
          color: Colors.grey[300],
        ),
        Padding(
          padding: const EdgeInsets.only(top: Sizes.small),
          child: Text(
            description,
            style: TextStyle(
              fontSize: Sizes.large,
              color: Colors.grey[500],
            ),
          ),
        )
      ],
    );
  }
}
