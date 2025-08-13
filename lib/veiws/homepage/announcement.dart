// veiws/homepage/announcement.dart
import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/components/widgets/empty_page.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Announcement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Announcement();
  }
}

class _Announcement extends State<Announcement> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, width: 1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            detailes(text: "الإعلان", icon: Icons.brush_outlined),
            Consumer<Signinprovider>(
              builder: (context, value, child) {
                return value.getbanner == null ? Center(child: CircularProgressIndicator(),) : value.getbanner['data'] == null || value.getbanner['data'].isEmpty ? Center( child: EmptyPage(),) : 
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.getbanner['data'].length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 350, maxWidth: 290),
                          child: AspectRatio(
                            aspectRatio: 476 / 263,
                            child: value.isLoading
                                ? CircularProgressIndicator()
                                : Image.network(
                                    '${value.baseurl}/${value.getbanner?['data']?[index]?['image']}',
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null)
                                        return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value:
                                              loadingProgress.expectedTotalBytes != null
                                              ? loadingProgress.cumulativeBytesLoaded /
                                                    loadingProgress.expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) => Center(
                                      child: Image.asset(
                                        "assets/images/4d854858222d976bb3462a530ab2044a7420c313.png",
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      );
                    }
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class detailes extends StatelessWidget {
  final String text;
  final IconData icon;

  const detailes({super.key, required this.text, required this.icon});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "$text",
          style: AppTextStyles.style20w400(
            context,
          ).copyWith(color: AppColors.BabyBlack, fontFamily: 'Tajawal'),
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width < 600
              ? MediaQuery.of(context).size.width / 20
              : MediaQuery.of(context).size.width < 1200
              ? MediaQuery.of(context).size.width / 25
              : MediaQuery.of(context).size.width / 45,
          height: MediaQuery.of(context).size.width < 600
              ? MediaQuery.of(context).size.width / 20
              : MediaQuery.of(context).size.width < 1200
              ? MediaQuery.of(context).size.width / 25
              : MediaQuery.of(context).size.width / 45,
          decoration: BoxDecoration(
            color: AppColors.violet,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Icon(
            icon,
            size: MediaQuery.of(context).size.width < 600
                ? 10
                : MediaQuery.of(context).size.width < 1200
                ? 15
                : 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
