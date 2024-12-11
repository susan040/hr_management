import 'package:flutter/material.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';

class EventsWidgets extends StatelessWidget {
  const EventsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 14),
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightPink,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Upcoming Holidays", style: CustomTextStyles.f16W600()),
          Text("public holidays",
              style: CustomTextStyles.f12W400(
                  color: AppColors.secondaryTextColor)),
          const SizedBox(height: 15),
          EventItem(date: "September 5", day: "Sunday", title: "laxmi Puja"),
          const SizedBox(height: 3),
          Divider(
            thickness: 0.4,
            color: AppColors.secondaryTextColor,
          ),
          const SizedBox(height: 3),
          EventItem(date: "November 15", day: "Tuesday", title: "Holi"),
          const SizedBox(height: 3),
          Divider(
            thickness: 0.4,
            color: AppColors.secondaryTextColor,
          ),
          const SizedBox(height: 3),
          EventItem(date: "November 21", day: "Friday", title: "Boot camp"),
          const SizedBox(height: 3),
          Divider(
            thickness: 0.4,
            color: AppColors.secondaryTextColor,
          ),
          const SizedBox(height: 3),
          EventItem(
              date: "August 8", day: "Monday", title: "Business idea pitching"),
          const SizedBox(height: 3),
          Divider(
            thickness: 0.4,
            color: AppColors.secondaryTextColor,
          ),
        ],
      ),
    );
  }
}

class EventItem extends StatelessWidget {
  final String date;
  final String day;
  final String title;

  const EventItem({
    required this.date,
    required this.day,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 90,
                child: Text(date, style: CustomTextStyles.f12W600())),
            Text(day,
                style: CustomTextStyles.f12W400(
                    color: AppColors.secondaryTextColor)),
          ],
        ),
        Container(height: 40, width: 1.5, color: AppColors.primaryColor),
        const SizedBox(width: 15),
        Text(title, style: CustomTextStyles.f12W600()),
      ],
    );
  }
}

class HolidaysWidget extends StatelessWidget {
  const HolidaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 14),
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightPink,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Upcoming Events", style: CustomTextStyles.f16W600()),
          Text("public events",
              style: CustomTextStyles.f12W400(
                  color: AppColors.secondaryTextColor)),
          const SizedBox(height: 15),
          EventItem(
              date: "March 6", day: "Monday", title: "Rangoli creativity"),
          const SizedBox(height: 3),
          Divider(
            thickness: 0.4,
            color: AppColors.secondaryTextColor,
          ),
          const SizedBox(height: 3),
          EventItem(date: "June 17", day: "Tuesday", title: "Treasure hunt"),
          const SizedBox(height: 3),
          Divider(
            thickness: 0.4,
            color: AppColors.secondaryTextColor,
          ),
          const SizedBox(height: 3),
          EventItem(date: "July 21", day: "Friday", title: "Boot camp"),
          const SizedBox(height: 3),
          Divider(
            thickness: 0.4,
            color: AppColors.secondaryTextColor,
          ),
          const SizedBox(height: 3),
          EventItem(date: "November 21", day: "Friday", title: "Good Friday"),
          const SizedBox(height: 3),
          Divider(
            thickness: 0.4,
            color: AppColors.secondaryTextColor,
          ),
        ],
      ),
    );
  }
}
