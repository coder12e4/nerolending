import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view/home/widgets/category_container.dart';
import '../colors/colors.dart';

class AgentTileWidget extends StatelessWidget {
  const AgentTileWidget({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    this.onTap,
    this.location,
  });
  final String? image;
  final String title;
  final String? location;
  final String rating;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 90.h,
        width: double.infinity,
        child: GlassMorphism(
          boarderColor: lightBlackColor,
          start: .1,
          end: .1,
          child: Row(
            children: [
              SizedBox(
                width: 15.w,
              ),
              Image.network(
                image ?? "",
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    height: 60.h,
                    width: 65.w,
                    child: const Icon(Icons.error),
                  );
                },
                height: 60.h,
                width: 65.w,
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
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
                    location ?? 'Location not Available',
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
                        initialRating: 4.5,
                        itemSize: 17.0,
                        unratedColor: starGoldColor.withOpacity(.5),
                        minRating: .5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 1,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: starGoldColor,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      Text(
                        rating,
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
          ),
        ),
      ),
    );
  }
}
