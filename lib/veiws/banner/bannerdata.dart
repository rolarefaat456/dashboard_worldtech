// veiws/banner/bannerdata.dart
import 'package:dashboard/components/widgets/animationadding.dart';
import 'package:dashboard/components/widgets/empty_page.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bannerdata extends StatefulWidget {
  Bannerdata({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Bannerdata();
  }
}

class _Bannerdata extends State<Bannerdata> {
  EditSuccessDialog editSuccessDialog = EditSuccessDialog();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Signinprovider>(context, listen: false).GetBanner();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<Signinprovider>(
      builder: (context, value, child) {
        
       
        return value.getbanner == null ?Center(child: CircularProgressIndicator()):value.getbanner['data'] == null||
            value.getbanner['data'].isEmpty?Center(child: EmptyPage()):  GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,

                itemCount: value.getbanner['data'].length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width < 600
                      ? 1
                      : MediaQuery.of(context).size.width < 1200
                      ? 2
                      : 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width < 600
                          ? MediaQuery.of(context).size.width / 2
                          : MediaQuery.of(context).size.width < 1200
                          ? MediaQuery.of(context).size.width / 2
                          : MediaQuery.of(context).size.width / 4,
                      height: 100,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await value.DeleteBanner(
                                    id: value.getbanner['data'][index]['id'],
                                  );
                                  if (value.check){
                                    editSuccessDialog.showEditSuccessDialog(
                                  context,
                                  title: 'تم الحذف بنجاح' ,
                                    check: value.check,
                                    onpressed: () => Navigator.pop(context),
                                );
                                  }
                                  else{
                                    editSuccessDialog.showEditSuccessDialog(
                                  context,
                                  title: 'فشل الحذف ' ,
                                    check: value.check,
                                    onpressed: () => Navigator.pop(context),
                                );
                                  }
                                  print('delete is done');
                                },
                                icon: Icon(Icons.delete_outline_rounded),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              await value.pickImageFromGallery();
                              if (value.getImage == null) return;

                              if (!mounted) return;
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) =>
                                    Center(child: CircularProgressIndicator()),
                              );

                              await value.UpdateBanner(
                                id: value.getbanner['data'][index]['id'],
                              );

                              if (!mounted) return;

                              Navigator.pop(context);

                              await Future.delayed(Duration(milliseconds: 200));

                              if (!mounted) return;
                              print("Update response => ${value.updateBanner}");
                              if (value.updateBanner['status'] == true) {
                                editSuccessDialog.showEditSuccessDialog(
                                  context,
                                  title: 'تم التعديل بنجاح' ,
                                    check: value.check,
                                    onpressed: () => Navigator.pop(context),
                                );
                              } else {
                                editSuccessDialog.showEditSuccessDialog(
                                  context,
                                  title: 'فشل التعديل '  ,
                                    check: value.check,
                                    onpressed: () => Navigator.pop(context),
                                );
                                print('done');
                              }
                            },
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Image.network(
                                '${value.baseurl}/${value.getbanner['data'][index]['image']}',
                                fit: BoxFit.cover,
                                cacheWidth: 500
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
