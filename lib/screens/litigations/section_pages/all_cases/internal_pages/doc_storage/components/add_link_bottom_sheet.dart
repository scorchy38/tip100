import 'dart:developer';

import 'package:tip100/core/components/dropdown_large.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddLinkSheet extends StatefulWidget {
  const AddLinkSheet({Key? key}) : super(key: key);

  @override
  _AddLinkSheetState createState() => _AddLinkSheetState();
}

class _AddLinkSheetState extends State<AddLinkSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  List<String>? titles = [
    'Document Title',
    "Application for deletion of parties",
    "Applications for better particulars",
    "Arguments",
    "Case Notes",
    "Complaint Copy",
    "Complaint History",
    "Daily Order",
    "Evidence",
    "Final Order",
    "Jobs Sheet",
    "Opposite Evidence- draft",
    "Opposite Evidence- final",
    "Summons",
    "Supporting Documents",
    "Vakalatnama",
    "Written Statement- draft",
    "Written Statement- final"
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 332,
        child: Scaffold(
          backgroundColor: AppColors.offWhite,
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDefaults.padding, vertical: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: AppLargeDropdown(
                      dropdownValue: 'Document Title',
                      values: titles,
                      controller: titleController,
                      width: 300,
                      label: 'Document Title'),
                ),
                // AppTextField(false, titleController, 'Document Title', 1.2),
                SizedBox(
                  height: 20,
                ),
                AppTextField(false, descriptionController, 'Description ', 1.2),
                SizedBox(
                  height: 20,
                ),
                AppTextField(
                    false, addressController, 'Insert Link Address', 1.2),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Text(
                        'Discard',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: InkWell(
                        onTap: () async {
                          final SharedPreferences _prefs =
                              await SharedPreferences.getInstance();
                          log('File Details');

                          FormData formData = await FormData.fromMap({
                            'title': titleController.text,
                            'description': descriptionController.text,
                            'doc_link': addressController.text,
                            'document': '[object Object]',
                            'document_file': null
                          });
                          print(formData.fields.toString());
                          Dio dio = new Dio();
                          dio.options.headers["Authorization"] =
                              "JWT ${_prefs.getString('token')}";
                          dio.options.headers["Content-Type"] =
                              "multipart/form-data; boundary=<calculated when request is sent>";
                          var url = Uri.parse(
                              'https://corporate.legistify.com/api/case/2601879/documents/');
                          var res = await dio.post(
                              'http://corporate.legistify.com/api/case/2601879/documents/',
                              data: formData);
                          if (res.statusCode != 201) {
                            Fluttertoast.showToast(
                              msg: "Error code ${res.statusCode}",
                              // toastLength: Toast.LENGTH_SHORT,
                              // gravity: ToastGravity.CENTER,
                              // timeInSecForIosWeb: 1,
                              // backgroundColor: Colors.red,
                              // textColor: Colors.white,
                              // fontSize: 16.0
                            );
                            throw Exception(
                                'http.post error: statusCode= ${res.statusCode}');
                          } else {
                            context
                                .read<AllCasesDetailsBloc>()
                                .add(GetDocStorageItems(2601879));
                            Fluttertoast.showToast(
                              msg: "New Link Added",
                              // toastLength: Toast.LENGTH_SHORT,
                              // gravity: ToastGravity.CENTER,
                              // timeInSecForIosWeb: 1,
                              // backgroundColor: Colors.red,
                              // textColor: Colors.white,
                              // fontSize: 16.0
                            );
                            Navigator.of(context).pop();
                          }

                          print(res.data);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 4,
                          color: (titleController.value.text.length > 2 &&
                                  descriptionController.value.text.length > 2 &&
                                  addressController.value.text.length > 2)
                              ? AppColors.appBlue
                              : AppColors.appGrey,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppIcons.save),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Save Link',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
