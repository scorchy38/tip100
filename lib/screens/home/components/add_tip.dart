import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tip100/core/components/dropdown.dart';
import 'package:path_provider/path_provider.dart';

import 'package:tip100/core/components/dropdown_large.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_filters_bloc/all_cases_filters_bloc.dart';
import 'package:tip100/logic/bloc/form_submission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as p;
import 'package:tip100/screens/home/components/add_audio_tip.dart';
import 'package:tip100/screens/home/components/quiz_page.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../size_config.dart';
import '../../../core/components/cta_blue_buttons.dart';
import '../../../core/components/small_button_transparent.dart';
import '../../../logic/place_service.dart';
import '../../litigations/section_pages/all_cases/components/address_search.dart';

const kGoogleApiKey = "AIzaSyDjQsSmkGgzs-XHVjW3pZQadKCGpuVs9i4";

class AddTip extends StatefulWidget {
  const AddTip({Key? key}) : super(key: key);

  @override
  _AddTipState createState() => _AddTipState();
}

class _AddTipState extends State<AddTip> {
  TextEditingController locationController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController crimeCategoryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController courtController = TextEditingController();
  final soundRecorderAndPlayer = SoundRecorderAndPlayer();
  bool isRecording = false, isRecorded = false;
  int type = MAXINT, court = MAXINT, city = MAXINT;
  String priority = 'NULL';
  List typeMaps = [],
      courtMaps = [],
      cityMaps = [],
      priorityMaps = [],
      categoryMaps = [],
      timeMaps = [];
  bool submitting = false;
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  bool active = false;
  bool activeStart = false;
  bool docSelected = false;
  bool audioSelected = false;
  String setIcon = 'doc';
  String category = '';
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
      type: FileType.media,
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

  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  // final searchScaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedStartDate ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedStartDate) {
      setState(() {
        selectedStartDate = picked;
      });
    }
  }

  Mode _mode = Mode.overlay;

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState?.showSnackBar(
      SnackBar(content: Text(response.errorMessage!)),
    );
  }

  Future<bool> _hasAcceptedPermissions() async {
    if (Platform.isAndroid) {
      await Permission.storage.request();
      await Permission.accessMediaLocation.request();
      await Permission.manageExternalStorage.request();
      if (await Permission.storage.isGranted &&
          // access media location needed for android 10/Q
          await Permission.accessMediaLocation.isGranted &&
          // manage external storage needed for android 11/R
          await Permission.manageExternalStorage.isGranted) {
        return true;
      } else {
        return false;
      }
    }
    // if (Platform.isIOS) {
    //   if (await _requestPermission(Permission.photos)) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // }
    else {
      // not android or ios
      return false;
    }
  }

  Future<void> _handlePressButton() async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: _mode,
      language: "en",
      strictbounds: false,
      types: [],
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      components: [Component(Component.country, "fr")],
    );

    displayPrediction(p!, homeScaffoldKey.currentState!);
  }

  Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
    if (p != null) {
      // get detail (lat/lng)
      GoogleMapsPlaces _places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await GoogleApiHeaders().getHeaders(),
      );
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId!);
      final lat = detail.result.geometry?.location.lat;
      final lng = detail.result.geometry?.location.lng;

      scaffold.showSnackBar(
        SnackBar(content: Text("${p.description} - $lat/$lng")),
      );
    }
  }

  String globalPath = '';

  @override
  void initState() {
    globalPath = randomAlphaNumeric(10);
    _hasAcceptedPermissions();
    soundRecorderAndPlayer.init("TIP");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text(
          'Report Anonymously',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SvgPicture.asset(
              AppIcons.close,
              color: Colors.black,
              height: 15,
            ),
          ),
        ),
      ),
      body: BlocListener<AddCaseBloc, AddCaseState>(
        listener: (context, state) {
          var current = state.formSubmissionStatus;
          if (current is SubmissionSuccess) {
            setState(() {
              submitting = !submitting;
            });
            context.read<AddCaseBloc>().add(EventComplete());
            // Navigator.pop(context);
          } else if (current is SubmissionFailed) {}
        },
        child: Builder(builder: (context) {
          courtMaps = context.watch<AllCasesFiltersBloc>().state.court!;
          typeMaps = context.watch<AllCasesFiltersBloc>().state.case_type!;
          cityMaps = [
            {
              'id': 5856,
              'name': 'Delhi',
            },
            {
              'id': 5856,
              'name': 'Bareilly',
            },
            {
              'id': 5856,
              'name': 'Noida',
            },
          ];
          cityMaps = [
            {'name': 'Delhi'}
          ];
          priorityMaps = [
            {'lvl': 5, 'name': 'Urgent Attention Required'},
            {'lvl': 3, 'name': 'Medium'},
            {'lvl': 1, 'name': 'Low'}
          ];
          timeMaps = [
            {'name': 'Morning'},
            {'name': 'Afternoon'},
            {'name': 'Evening'},
            {'name': 'Night'},
            {'name': 'After Midnight'},
          ];

          categoryMaps = [
            {'name': 'Minor Crimes'},
            {'name': 'Assault'},
            {'name': 'Drugs'},
            {'name': 'Rape'},
            {'name': 'Murder'},
          ];
          List<String>? crimeCategory = ['Select Crime Category'];
          crimeCategoryController.text = 'Crime Category';
          categoryMaps.forEach((element) {
            crimeCategory.add(element['name']);
          });

          List<String>? courts = ['Court'];
          courtController.text = 'Court';
          courtMaps.forEach((element) {
            courts.add(element['name']);
          });

          List<String>? cities = ['City'];
          cityController.text = 'City';
          cityMaps.forEach((element) {
            cities.add(element['name']);
          });

          List<String>? priorities = ['Priority(Optional)'];
          priorityController.text = 'Priority(Optional)';
          priorityMaps.forEach((element) {
            priorities.add(element['name']);
          });
          List<String>? times = ['Time(Optional)'];
          timeController.text = 'Time(Optional)';
          timeMaps.forEach((element) {
            times.add(element['name']);
          });
          //TODO:API Key
          //AIzaSyDXNZCwKUH27mXhnft-gbmOeDN6MvIlMN8
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.89,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppDefaults.padding,
                        top: AppDefaults.padding,
                        right: AppDefaults.padding),
                    child: Container(
                      width: 400,
                      child: AppLargeDropdown(
                          width: 300,
                          dropdownValue: 'Select Crime Category',
                          values: crimeCategory,
                          controller: crimeCategoryController,
                          label: 'Crime Category'),
                    ),
                  ),
                  // TextField(
                  //   controller: locationController,
                  //   readOnly: true,
                  //   onTap: () async {
                  //     // generate a new token here
                  //     final sessionToken = Uuid().v4();
                  //     PlaceApiProvider apiClient =
                  //         PlaceApiProvider(sessionToken);
                  //     final Suggestion? result = await showSearch(
                  //       context: context,
                  //       delegate: AddressSearch(sessionToken, apiClient),
                  //     );
                  //     // This will change the text displayed in the TextField
                  //     if (result != null) {
                  //       final placeDetails =
                  //           await PlaceApiProvider(sessionToken)
                  //               .getPlaceDetailFromId(result.placeId);
                  //       setState(() {
                  //         locationController.text = result.description;
                  //         print(placeDetails.streetNumber);
                  //         print(placeDetails.street);
                  //         print(placeDetails.city);
                  //         print(placeDetails.zipCode);
                  //       });
                  //     }
                  //   },
                  //   decoration: InputDecoration(
                  //     icon: Container(
                  //       width: 10,
                  //       height: 10,
                  //       child: Icon(
                  //         Icons.home,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //     hintText: "Enter your shipping address",
                  //     border: InputBorder.none,
                  //     contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: _handlePressButton,
                  //   child: Container(
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Text('Search'),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppDefaults.padding,
                        top: AppDefaults.padding,
                        right: AppDefaults.padding),
                    child: AppTextField(
                      false,
                      locationController,
                      'Location',
                      1.2,
                      onChanged: (value) {
                        context
                            .read<AddCaseBloc>()
                            .add(EventAddTitle(title: value!));
                        // setState(() {});
                      },
                      helper:
                          'Please enter the nearest landmark/accurate location of the crime.',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: AppDefaults.padding),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       AppLargeDropdown(
                  //           dropdownValue: 'Case Type',
                  //           values: crimeCategory,
                  //           controller: crimeCategoryController,
                  //           label: 'Case Type'),
                  //       AppLargeDropdown(
                  //           dropdownValue: 'Court',
                  //           values: courts,
                  //           controller: courtController,
                  //           label: 'Court'),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDefaults.padding),

                    //City //Priority

                    child: AppLargeDropdown(
                        width: 300,
                        dropdownValue: 'Priority(Optional)',
                        values: priorities,
                        controller: priorityController,
                        label: 'Priority(Optional)'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDefaults.padding),
                    child: AppTextField(
                      false,
                      summaryController,
                      'Details',
                      4,
                      onChanged: (value) {
                        context
                            .read<AddCaseBloc>()
                            .add(EventAddDescription(description: value!));
                        // setState(() {});
                      },
                      helper:
                          'Please try to enter as detailed information as possible, including everything you know about the crime.',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                await _selectStartDate(context);
                                setState(() {
                                  activeStart = true;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color:
                                          AppColors.primary.withOpacity(0.05),
                                      spreadRadius: 1,
                                      blurRadius: 5)
                                ]),
                                child: Card(
                                  // elevation: 3,
                                  shadowColor: Colors.transparent,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(11),
                                    child: Row(
                                      children: [
                                        Text(
                                          selectedStartDate == null
                                              ? 'Date of Incident'
                                              : '${selectedStartDate!.day}/${selectedStartDate!.month}/${selectedStartDate!.year}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: !activeStart
                                                    ? AppColors.appGrey
                                                    : Colors.black,
                                              ),
                                        ),
                                        Spacer(),
                                        SvgPicture.asset(AppIcons.calendar2,
                                            color: !activeStart
                                                ? AppColors.tertiary
                                                : AppColors.primary)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text('~',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: AppColors.appGrey)),
                          Expanded(
                            child: AppLargeDropdown(
                                width: 128,
                                dropdownValue: 'Time(Optional)',
                                values: times,
                                controller: timeController,
                                label: 'Time(Optional)'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  !docSelected
                      ? CTABlueButtons(
                          buttonColor: AppColors.primary,
                          buttonIcon: AppIcons.addButton,
                          buttonText: 'Select Supporting Images/Videos',
                          onTap: () {
                            pickFile();
                          },
                          width: 262)
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
                                  Container(
                                    width: 300,
                                    child: Text(
                                      p.basename(file.path),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              overflow: TextOverflow.ellipsis,
                                              color: AppColors.appGrey,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        docSelected = false;
                                      });
                                    },
                                    child: SmallButtonTransparent(
                                        buttonColor: AppColors.appRed,
                                        buttonIcon: AppIcons.delete)),
                              )
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  !isRecording && !isRecorded
                      ? CTABlueButtons(
                          buttonColor: AppColors.primary,
                          buttonIcon: AppIcons.addButton,
                          buttonText: 'Record Supporting Audio',
                          onTap: () async {
                            Directory directory;

                            directory = (await getExternalStorageDirectory())!;
                            String newPath = "";
                            List<String> paths = directory.path.split("/");
                            for (int x = 1; x < paths.length; x++) {
                              String folder = paths[x];
                              if (folder != "Android") {
                                newPath += "/" + folder;
                              } else {
                                break;
                              }
                            }
                            String fileName = 'Recording-Varta-' +
                                "TIP" +
                                '-' +
                                globalPath +
                                '.aac';
                            newPath = newPath + "/Vaarta/Recordings";
                            directory = Directory(newPath);
                            File saveFile = File(directory.path + "/$fileName");
                            if (!await directory.exists()) {
                              await directory.create(recursive: true);
                            }
                            if (await directory.exists()) {
                              log(newPath + fileName);
                              soundRecorderAndPlayer
                                  .startRecording(saveFile.path);
                            }
                            setState(() {
                              isRecording = true;
                            });
                            print('Recording-Varta-' +
                                "TIP" +
                                '-' +
                                globalPath +
                                '.aac');
                          },
                          width: 262)
                      : isRecording && !isRecorded
                          ? CTABlueButtons(
                              buttonColor: AppColors.primary,
                              buttonIcon: AppIcons.save,
                              buttonText: 'Audio Recording',
                              onTap: () async {
                                soundRecorderAndPlayer.stopRecording();

                                setState(() {
                                  isRecording = true;
                                  isRecorded = true;
                                });
                                print('Recording-Varta-' +
                                    "TIP" +
                                    '-' +
                                    globalPath +
                                    '.aac');
                              },
                              width: 262)
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      icons[setIcon],
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 300,
                                        child: Text(
                                          'Recording-Varta-' +
                                              "TIP" +
                                              '-' +
                                              globalPath +
                                              '.aac',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: AppColors.appGrey,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            isRecorded = false;
                                            isRecording = false;
                                          });
                                        },
                                        child: SmallButtonTransparent(
                                            buttonColor: AppColors.appRed,
                                            buttonIcon: AppIcons.delete)),
                                  )
                                ],
                              ),
                            ),
                  Spacer(),
                  Container(
                    height: getProportionateScreenHeight(96),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5, color: Colors.black.withOpacity(0.4))
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35.0, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              // context.read<AddCaseBloc>().add(EventSubmitted());
                              setState(() {});
                            },
                            child: Text(
                              'Clear All',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: AppColors.appGrey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              final SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              setState(() {
                                submitting = !submitting;
                              });
                              String fileURL = '';
                              String audioURL = '';
                              if (file.path != '') {
                                final storageRef =
                                    FirebaseStorage.instance.ref();
                                final fileRef =
                                    storageRef.child(p.basename(file.path));
                                try {
                                  await fileRef.putFile(file);
                                } on FirebaseException catch (e) {
                                  print(e);
                                  print("Error");
                                }

                                fileURL = await fileRef.getDownloadURL();
                              } else {}
                              if (isRecorded == true) {
                                File audioFile = File(
                                    "/storage/emulated/0/Vaarta/Recordings/" +
                                        'Recording-Varta-' +
                                        "TIP" +
                                        '-' +
                                        globalPath +
                                        '.aac');
                                final storageRef =
                                    FirebaseStorage.instance.ref();

                                final audioFileRef = storageRef.child(
                                    'Recording-Varta-' +
                                        "TIP" +
                                        '-' +
                                        globalPath +
                                        '.aac');
                                try {
                                  await audioFileRef.putFile(audioFile);
                                } on FirebaseException catch (e) {
                                  print(e);
                                  print("Error");
                                }

                                audioURL = await audioFileRef.getDownloadURL();
                              }
                              print(audioURL);

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => QuizPage(
                                        payLoad: {
                                          "crimeType": context
                                              .read<AddCaseBloc>()
                                              .state
                                              .crimeType,
                                          "description": summaryController.text,
                                          "mediaURL": fileURL == '' &&
                                              audioURL == ''
                                              ? []
                                              : fileURL != '' && audioURL != ''
                                              ? [fileURL, audioURL]
                                              : fileURL != ''
                                              ? [fileURL]
                                              : [audioURL],                                          "urgency": context
                                              .read<AddCaseBloc>()
                                              .state
                                              .priority,
                                          "crimeTime": context
                                              .read<AddCaseBloc>()
                                              .state
                                              .title,
                                          "dateOfIncident": selectedStartDate!
                                              .millisecondsSinceEpoch
                                              .toString(),
                                          "score": "0",
                                          "uid": "${_prefs.getString('token')}",
                                          "userScore":
                                              "${_prefs.getDouble('score')}",
                                          "address": locationController.text
                                        },
                                        scorePayLoad: {
                                          "text": "Hello",
                                          "state": "Pondicherry",
                                          "district": "Pondicherry",
                                          "crime": "ROBBERY",
                                          "video":
                                              "https://firebasestorage.googleapis.com/v0/b/fitnessaddictiongym-d43c4.appspot.com/o/WhatsApp%20Video%202022-08-22%20at%2012.19.20%20AM.mp4?alt=media&token=708e6ab1-fb21-46ba-b925-e12402b19571",
                                          "audio":
                                              "https://firebasestorage.googleapis.com/v0/b/fitnessaddictiongym-d43c4.appspot.com/o/gettysburg.wav?alt=media&token=62323142-1138-4b23-93e8-ab51db58f8d2",
                                          "tipIndex": "4"
                                        },
                                        // type: context
                                        // .read<AddCaseBloc>()
                                        // .state
                                        // .crimeType=="Rape"?"rape1":context
                                        //     .read<AddCaseBloc>()
                                        //     .state
                                        //     .crimeType=="Drugs"?"rape":"Violent crimes"
                                     type:   "Violent crimes",
                                        // type: context
                                        //     .read<AddCaseBloc>()
                                        //     .state
                                        //     .crimeType,
                                      )));
                            },
                            // onTap: () async {
                            //   setState(() {
                            //     submitting = !submitting;
                            //   });
                            //   String fileURL = '';
                            //   if (file.path != '') {
                            //     final storageRef =
                            //         FirebaseStorage.instance.ref();
                            //     final fileRef =
                            //         storageRef.child(p.basename(file.path));
                            //     try {
                            //       await fileRef.putFile(file);
                            //     } on FirebaseException catch (e) {
                            //       print(e);
                            //       print("Error");
                            //     }
                            //
                            //     fileURL = await fileRef.getDownloadURL();
                            //   } else {}
                            //   // context.read<AddCaseBloc>().add(EventSubmitted(
                            //   //     crimeCategory: crimeCategoryController.text,
                            //   //     location: locationController.text,
                            //   //     priority: priorityController.text,
                            //   //     description: summaryController.text,
                            //   //     time:
                            //   //         "${selectedStartDate!.day}/${selectedStartDate!.month}/${selectedStartDate!.year}",
                            //   //     crimeTime: timeController.text,
                            //   //     dateOfIncident: selectedStartDate!
                            //   //         .millisecondsSinceEpoch
                            //   //         .toString(),
                            //   //     fileRef: fileURL));
                            //   Dio dio = Dio();
                            //   final SharedPreferences _prefs =
                            //       await SharedPreferences.getInstance();
                            //
                            //   Response response = await dio.post(
                            //       'https://tip100.herokuapp.com/addTip',
                            //       data: {
                            //         "crimeType": context
                            //             .read<AddCaseBloc>()
                            //             .state
                            //             .crimeType,
                            //         "description": summaryController.text,
                            //         "mediaURL": [fileURL],
                            //         "urgency": context
                            //             .read<AddCaseBloc>()
                            //             .state
                            //             .priority,
                            //         "crimeTime":
                            //             context.read<AddCaseBloc>().state.title,
                            //         "dateOfIncident": selectedStartDate!
                            //             .millisecondsSinceEpoch
                            //             .toString(),
                            //         "score": "0",
                            //         "uid": "${_prefs.getString('token')}",
                            //         "userScore": "${_prefs.getString('score')}",
                            //         "address": locationController.text
                            //       });
                            //   if (response.data['message'] ==
                            //       'A block is MINED') {
                            //     Fluttertoast.showToast(
                            //         msg: 'Tip has been submitted anonymously!');
                            //     Navigator.pop(context);
                            //   }
                            //   // setState(() {});
                            // },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 4,
                              color: AppColors.primary,
                              child: submitting == true
                                  ? Container(
                                      width: 95,
                                      height: 45,
                                      child: Center(
                                        child: CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Colors.transparent,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Text(
                                        'Submit Report',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15),
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
