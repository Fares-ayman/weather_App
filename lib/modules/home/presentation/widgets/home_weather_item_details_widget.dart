import 'package:flutter/material.dart';

class HomeWeatherItemDetailsWidget extends StatelessWidget {
  final String image;
  final String title;
  final String details;
  const HomeWeatherItemDetailsWidget({
    super.key,
    required this.image,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          scale: 8,
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 3),
            Text(
              details,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ],
        )
      ],
    );
  }
}
