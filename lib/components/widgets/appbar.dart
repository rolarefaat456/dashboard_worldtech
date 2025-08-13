// components/widgets/appbar.dart
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/components/widgets/empty_page.dart';
import 'package:dashboard/veiws/homepage/adminprofile.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Appbarr extends StatefulWidget {
  final String title;

  const Appbarr({super.key, required this.title});

  @override
  State<Appbarr> createState() => _AppbarrState();
}

class _AppbarrState extends State<Appbarr> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Signinprovider>(context, listen: false).profile();
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<Signinprovider>(
      builder: (context, value, child) {
        return value.profilee == null
    ? Center(child: CircularProgressIndicator())
    : value.profilee['data'] == null
        ? Center(child: EmptyPage()) 
            : Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 56),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(top: 10, left: 20),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 181, 240, 180),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (_) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                  await value.profile();
                                  Navigator.of(context).pop();
                                  if (value.profilee != null &&
                                      value.profilee['status'] == true) {
                                    ShowAlert(
                                      context: context,
                                      image:
                                          (value.profilee?['data'] != null &&
                                              value.profilee['data']['image'] !=
                                                  null &&
                                              value
                                                  .profilee['data']['image']
                                                  .isNotEmpty)
                                          ? '${value.baseurl}/${value.profilee['data']['image']}'
                                          : '',
                                      name:
                                          value.profilee?['data']?['name'] ??
                                          '',
                                      phone:
                                          value.profilee?['data']?['email'] ??
                                          '',
                                      index: 0,
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "فشل في جلب بيانات البروفايل",
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Row(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: CircleAvatar(
                                        backgroundImage:
                                            (value.profilee?['data'] != null &&
                                                value.profilee['data']['image'] !=
                                                    null &&
                                                value
                                                    .profilee['data']['image']
                                                    .isNotEmpty)
                                            ? NetworkImage(
                                                "${value.baseurl}/${value.profilee['data']['image']}",
                                              )
                                            : null,
                                        child:
                                            (value.profilee?['data'] == null ||
                                                value.profilee['data']['image'] ==
                                                    null ||
                                                value
                                                    .profilee['data']['image']
                                                    .isEmpty)
                                            ? Icon(Icons.broken_image)
                                            : null,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            value.profilee['data']['name'],
                                            style: AppTextStyles.style18w400(
                                              context,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              widget.title,
                              style: AppTextStyles.style24w500(
                                context,
                              ).copyWith(fontFamily: 'Tajawal'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
