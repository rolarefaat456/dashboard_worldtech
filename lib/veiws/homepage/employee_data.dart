// veiws/homepage/employee_data.dart
import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class DataEmployee extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const DataEmployee({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListTile(
        title: Text(
          title,
          textAlign: TextAlign.end,
          style: AppTextStyles.style16w400(context),
        ),
        subtitle: Text(
          subtitle,
          textAlign: TextAlign.end,
          style: AppTextStyles.style16w400(
            context,
          ).copyWith(color: AppColors.BiggerthanBabyBlack),
        ),
        trailing: CircleAvatar(
          radius: MediaQuery.of(context).size.width < 600
              ? MediaQuery.of(context).size.width / 25
              : MediaQuery.of(context).size.width < 1000
              ? MediaQuery.of(context).size.width / 35
              : MediaQuery.of(context).size.width / 45,
          backgroundImage: NetworkImage(image),
        ),
      ),
    );
  }
}
