import 'package:tip100/core/components/dropdown.dart';
import 'package:tip100/core/components/dropdown_large.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_filters_bloc/all_cases_filters_bloc.dart';
import 'package:tip100/logic/bloc/my_counsel_bloc/my_counsel_bloc.dart';
import 'package:tip100/logic/cubit/switch_cubit.dart';
import 'package:tip100/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_defaults.dart';
import '../../../../../core/constants/app_icons.dart';

class MyCounselFilters extends StatefulWidget {
  const MyCounselFilters({Key? key}) : super(key: key);

  @override
  _MyCounselFiltersState createState() => _MyCounselFiltersState();
}

class _MyCounselFiltersState extends State<MyCounselFilters> {
  bool active = false;
  bool activeStart = false;
  bool filterSelected = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  TextEditingController allFiltersController = TextEditingController();

  TextEditingController courtController = TextEditingController();
  int city = MAXINT, court = MAXINT;
  String allFilter = '';
  List courtMaps = [],
      cityMaps = [
        // {"id": 706, "name": "Delhi, Delhi", "state": 10},
        // {"id": 1557, "name": "Bengaluru, Karnataka", "state": 17},
        // {"id": 3377, "name": "Jaipur, Rajasthan", "state": 29},
        // {"id": 1125, "name": "Gurgaon, Haryana", "state": 13},
        // {"id": 3296, "name": "Alwar, Rajasthan", "state": 29},
        // {"id": 594, "name": "Chandigarh, Chandigarh", "state": 6},
        // {"id": 782, "name": "Ahmedabad, Gujarat", "state": 12},
        // {"id": 5583, "name": "Kolkata, West Bengal", "state": 36},
        // {"id": 2706, "name": "Mumbai, Maharashtra", "state": 21},
        // {"id": 4932, "name": "Lucknow, Uttar Pradesh", "state": 34}
      ],
      allFiltersMaps = [
        {"id": "AL", "name": "Active Lawyers"},
        {"id": "PL", "name": "Inactive Lawyers"},
        {"id": "exp", "name": "Sort By Experience"},
        {"id": "LC", "name": "Sort By Ongoing Cases"},
        {"id": "DC", "name": "Sort By Disposed Cases"},
        {"id": "ON", "name": "Sort By Open Notice"},
        {"id": "CN", "name": "Sort ByClose Notice"},
      ];

  @override
  void initState() {
    // stateController.text.compareTo('By State') != 0||  courtController.text.compareTo('By Court') != 0||  titleController.text.length > 0||caseTypeController.text.compareTo('By Case Type') != 0||caseStageController.text.compareTo('By Case Stage') != 0||caseManagerController.text.compareTo('By Case Manager') != 0
    // titleController.addListener(() {
    //   setState(() {});
    //   if (titleController.text.length > 0)
    //     context.read<SwitchCubit>().increase('Title');
    //   else
    //     context.read<SwitchCubit>().decrease('Title');
    // });
    // caseTypeController.addListener(() {
    //   filterSelected = caseTypeController.text.compareTo('By Case Type') != 0;
    //
    //   setState(() {});
    // });
    // caseStageController.addListener(() {
    //   setState(() {});
    //
    //   filterSelected = caseStageController.text.compareTo('By Case Stage') != 0;
    // });
    // caseManagerController.addListener(() {
    //   setState(() {});
    //   filterSelected =
    //       caseManagerController.text.compareTo('By Case Manager') != 0;
    // });
    // courtController.addListener(() {
    //   setState(() {});
    //   filterSelected = courtController.text.compareTo('By Court') != 0;
    // });
    // stateController.addListener(() {
    //   setState(() {});
    //   filterSelected = stateController.text.compareTo('By State') != 0;
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Search & Filters',
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
            padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 20),
            child: SvgPicture.asset(
              AppIcons.close,
              color: Colors.black,
              height: 15,
              width: 15,
            ),
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          courtMaps = context.watch<AllCasesFiltersBloc>().state.court!;
          cityMaps = context.watch<AllCasesFiltersBloc>().state.city_filters!;

          List<String>? courts = ['By Court'];
          courtController.text = 'By Court';
          context.watch<AllCasesFiltersBloc>().state.court?.forEach((element) {
            courts.add(element['name']);
          });

          List<String>? cities = ['By City'];
          cityController.text = 'By City';
          context
              .watch<AllCasesFiltersBloc>()
              .state
              .city_filters
              ?.forEach((element) {
            cities.add(element['name']);
          });

          List<String>? allFilters = ['All Filters'];
          allFiltersController.text = 'All Filters';
          allFiltersMaps.forEach((element) {
            allFilters.add(element['name']);
          });
          // List<String>? trackingTypes = ['By Tracking Type'];
          // trackingTypeController.text = 'By Tracking Type';
          // trackingTypeMaps.forEach((element) {
          //   trackingTypes.add(element['name']);
          // });

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 20, bottom: 15, right: 20),
                child: Container(
                    height: 45,
                    child: AppTextField(
                        false, titleController, 'Case No./Title', 1)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 5),
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4,
                      mainAxisSpacing: 15),
                  children: [
                    AppDropdown('By City', cities, cityController, 'By City'),
                    AppDropdown(
                        'By Court', courts, courtController, 'By Court'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: AppLargeDropdown(
                  dropdownValue: 'All Filters',
                  values: allFilters,
                  controller: allFiltersController,
                  label: 'All Filters',
                  width: MediaQuery.of(context).size.width * 0.76,
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
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            active = false;
                            activeStart = false;
                          });

                          titleController.clear();

                          courtController.clear();
                          cityController.clear();
                          allFiltersController.clear();

                          context
                              .read<MyCounselBloc>()
                              .add(MyCounselGetAllCounsels());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                      ),
                      Builder(
                        builder: (context) {
                          // bool selectedFilters = context
                          //     .watch<MyCounselFiltersBloc>()
                          //     .state
                          //     .filter_activated!;
                          return InkWell(
                            onTap: () async {
                              context
                                  .read<MyCounselBloc>()
                                  .add(MyCounselRefreshing());
                              setState(() {
                                courtMaps.forEach((element) {
                                  if (element['name'] == courtController.text)
                                    court = element['id'];
                                });

                                cityMaps.forEach((element) {
                                  if (element['name'] == cityController.text)
                                    city = element['id'];
                                });

                                allFiltersMaps.forEach((element) {
                                  if (element['name'] ==
                                      allFiltersController.text)
                                    allFilter = element['id'];
                                });
                              });

                              context
                                  .read<MyCounselBloc>()
                                  .add(MyCounselRefreshing());

                              context
                                  .read<MyCounselBloc>()
                                  .add(MyCounselGetFilteredResults(
                                    name: titleController.text,
                                    sort: allFilter,
                                    court: court,
                                    city: city,
                                  ));
                              // context
                              //     .read<MyCounselBloc>()
                              //     .add(MyCounselFiltersImplemented());
                              Navigator.pop(context);
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 4,
                              color: (activeStart ||
                                      active ||
                                      titleController.text.length > 0 ||
                                      context
                                              .watch<SwitchCubit>()
                                              .state
                                              .filtersSelected
                                              .length >
                                          0)
                                  ? AppColors.appBlue
                                  : AppColors.appGrey,
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: context.watch<MyCounselBloc>().state
                                        is MyCounselRefreshing
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Row(
                                        children: [
                                          Text(
                                            'Apply Filters',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    color: AppColors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: AppColors.white,
                                            size: 20,
                                          )
                                        ],
                                      ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
