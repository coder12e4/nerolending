import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/colors.dart';

class AgentDetailsTile extends StatelessWidget {
  const AgentDetailsTile(
      {super.key,
      required this.name,
      required this.image,
      required this.location,
      required this.starRating,
      required this.totalReviews});
  final String name;
  final String image;
  final String location;
  final String starRating;
  final String totalReviews;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          image,
          height: 60.h,
          width: 65.w,
          errorBuilder: (context, error, stackTrace) => SizedBox(
            height: 60.h,
            width: 65.w,
            child: const Icon(
              Icons.error,
              color: lightBlackColor,
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              location,
              style: const TextStyle(
                  color: smallTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: 1,
                  ignoreGestures: true,
                  itemSize: 17.0,
                  unratedColor: starGoldColor.withOpacity(.3),
                  minRating: .5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 1,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: starGoldColor,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                Text(
                  '$starRating | $totalReviews',
                  style: const TextStyle(
                    color: smallTextColor,
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
