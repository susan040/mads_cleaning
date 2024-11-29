import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  final double rating;

  const StarWidget({
    super.key,
    required this.rating, 
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    int fullStars = rating.toInt();
    bool hasHalfStar = rating - fullStars >= 0.5;

    // Add full stars
    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(
        Icons.star,
        color: Colors.amber,
        size: 18,
      ));
    }

    // Add half star if applicable
    if (hasHalfStar) {
      stars.add(const Icon(
        Icons.star_half,
        color: Colors.amber,
        size: 18,
      ));
    }

    // Add empty stars to make it 5
    for (int i = stars.length; i < 5; i++) {
      stars.add(const Icon(
        Icons.star_border,
        color: Colors.amber,
        size: 18,
      ));
    }

    return Row(children: stars);
  }
}
