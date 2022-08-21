import 'dart:developer';
import 'dart:io';

import 'package:tip100/core/components/cta_blue_buttons.dart';
import 'package:tip100/core/components/dropdown_large.dart';
import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/components/small_button_transparent.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

class AddDocSheet extends StatefulWidget {
  const AddDocSheet({Key? key}) : super(key: key);

  @override
  _AddDocSheetState createState() => _AddDocSheetState();
}

class _AddDocSheetState extends State<AddDocSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool docSelected = false;
  String setIcon = 'doc';
  Map icons = {
    'doc': SvgPicture.asset('assets/icon/doc.svg'),
    'pdf': SvgPicture.asset('assets/icon/pdf.svg'),
    'ppt': SvgPicture.asset('assets/icon/ppt.svg'),
    'txt': SvgPicture.asset('assets/icon/txt.svg'),
    'xls': SvgPicture.asset('assets/icon/xls.svg'),
    'jpg': SvgPicture.asset('assets/icon/img.svg'),
    'folder': SvgPicture.asset('assets/icon/folder.svg')
  };
  File file = File('');
  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        // allowedExtensions: [
        //   'doc',
        //   'docx',
        //   'jpg',
        //   'jpeg',
        //   'png',
        //   'pdf',
        //   'xls',
        //   'xlsx',
        //   'ppt',
        //   'pptx',
        //   'txt'
        // ]
        );

    if (result != null) {
      file = File(result.files.single.path!);
      setState(() {
        file = File(result.files.single.path!);
        docSelected = true;
      });
      if (p.basename(file.path).split('.')[1] == 'doc' ||
          p.basename(file.path).split('.')[1] == 'docx') {
        setState(() {
          setIcon = 'doc';
        });
      } else if (p.basename(file.path).split('.')[1] == 'pdf') {
        setState(() {
          setIcon = 'pdf';
        });
      } else if (p.basename(file.path).split('.')[1] == 'jpg' ||
          p.basename(file.path).split('.')[1] == 'png' ||
          p.basename(file.path).split('.')[1] == 'jpeg') {
        setState(() {
          setIcon = 'jpg';
        });
      } else if (p.basename(file.path).split('.')[1] == 'xls' ||
          p.basename(file.path).split('.')[1] == 'xlsx') {
        setState(() {
          setIcon = 'xls';
        });
      } else if (p.basename(file.path).split('.')[1] == 'txt') {
        setState(() {
          setIcon = 'txt';
        });
      } else if (p.basename(file.path).split('.')[1] == 'ppt' ||
          p.basename(file.path).split('.')[1] == 'pptx') {
        setState(() {
          setIcon = 'ppt';
        });
      } else {
        setState(() {
          setIcon = 'folder';
        });
      }
    } else {
      Fluttertoast.showToast(msg: 'File Picking Aborted!');
    }
  }

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
        height: 321,
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
                const SizedBox(
                  height: 20,
                ),
                AppTextField(false, descriptionController, 'Description ', 1.2),
                const SizedBox(
                  height: 20,
                ),
                !docSelected
                    ? CTABlueButtons(
                        buttonColor: AppColors.primary,
                        buttonIcon: AppIcons.addButton,
                        buttonText: 'Select Document',
                        onTap: () {
                          pickFile();
                        },
                        width: 160)
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                icons[setIcon],
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  p.basename(file.path),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: AppColors.appGrey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                ),
                              ],
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    docSelected = false;
                                  });
                                },
                                child: SmallButtonTransparent(
                                    buttonColor: AppColors.appRed,
                                    buttonIcon: AppIcons.delete))
                          ],
                        ),
                      ),
                const SizedBox(
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
                          log(file.path);
                          log(p.basename(file.path));
                          FormData formData = await FormData.fromMap({
                            'title': titleController.text,
                            'description': descriptionController.text,
                            'doc_link': "https://www.legistify.com/",
                            "document_file": await MultipartFile.fromFileSync(
                                file.path,
                                filename: p.basename(file.path)),
                            // 'document_file': await MultipartFile.fromFile(
                            //     file.path,
                            //     filename: p.basename(file.path)),
                            // 'document_file': null,
                            'document': '[object Object]',
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
                              msg: "New Doc Added",
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
                                  descriptionController.value.text.length > 2)
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
                                  'Upload Doc',
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
