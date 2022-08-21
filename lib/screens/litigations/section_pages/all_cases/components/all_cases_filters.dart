import 'package:tip100/core/components/dropdown.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_filters_bloc/all_cases_filters_bloc.dart';
import 'package:tip100/logic/cubit/switch_cubit.dart';
import 'package:tip100/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_defaults.dart';
import '../../../../../core/constants/app_icons.dart';

class AllCasesFilters extends StatefulWidget {
  const AllCasesFilters({Key? key}) : super(key: key);

  @override
  _AllCasesFiltersState createState() => _AllCasesFiltersState();
}

class _AllCasesFiltersState extends State<AllCasesFilters> {
  bool active = false;
  bool activeStart = false;
  bool filterSelected = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController orderTypeController = TextEditingController();
  TextEditingController amountClaimedController = TextEditingController();
  TextEditingController winEstimateController = TextEditingController();
  TextEditingController counselsEngagedController = TextEditingController();
  TextEditingController brandsController = TextEditingController();
  TextEditingController allFiltersController = TextEditingController();
  TextEditingController productsController = TextEditingController();
  TextEditingController trackingTypeController = TextEditingController();
  TextEditingController locationsEngagedController = TextEditingController();
  TextEditingController caseTypeController = TextEditingController();
  TextEditingController caseStageController = TextEditingController();
  TextEditingController caseManagerController = TextEditingController();
  TextEditingController courtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  int type = MAXINT,
      state = MAXINT,
      court = MAXINT,
      stage = MAXINT,
      manager = MAXINT;
  String region = '',
      status = '',
      orderType = '',
      amountClaimed = '',
      winEstimate = '',
      counsel = '',
      brand = '',
      product = '',
      trackingType = '',
      allFilter = '',
      locationEngaged = '';
  List managersMaps = [],
      typeMaps = [],
      stateMaps = [],
      courtMaps = [],
      regionMaps = [
        {'id': 'N', 'name': 'NORTH'},
        {'id': 'E', 'name': 'EAST'},
        {'id': 'S', 'name': 'SOUTH'},
        {'id': 'W', 'name': 'WEST'},
        {'id': 'C', 'name': 'CENTRAL'},
      ],
      statusMaps = [
        {'id': 'ON', 'name': 'Ongoing'},
        {'id': 'DI', 'name': 'Disposed'},
      ],
      orderTypeMaps = [
        {'id': 'FA', 'name': 'Favourable'},
        {'id': 'AG', 'name': 'Against'},
        {'id': 'AD', 'name': 'Adverse'},
      ],
      amountClaimedMaps = [
        {'id': 'less_than 25000', 'name': '< ₹25K'},
        {'id': 'more_than 25000', 'name': '₹25K - ₹75K'},
        {'id': 'less_than 150000', 'name': '₹75K - ₹1.5L'},
        {'id': 'more_than 150000', 'name': '> ₹1.5L'},
      ],
      winEstimateMaps = [
        {'id': 'RE', 'name': 'Remote'},
        {'id': 'PO', 'name': 'Possible'},
        {'id': 'PR', 'name': 'Probable'},
      ],
      counselsEngagedMaps = [
        {'id': 'Tarun Tyagi', 'name': 'Tarun Tyagi'},
        {'id': 'Sunny Gupta', 'name': 'Sunny Gupta'},
        {'id': 'Tanya Mahajan', 'name': 'Tanya Mahajan'},
      ],
      brandsMaps = [
        {'id': 'Demo Legistify', 'name': 'Demo Legistify'},
        {'id': 'amazon', 'name': 'amazon'},
        {'id': 'Chicago Bulls', 'name': 'Chicago Bulls'},
      ],
      productsMaps = [
        {'id': 'Mobile', 'name': 'Mobile'},
        {'id': 'Product Category', 'name': 'Product Category'},
        {'id': 'Television', 'name': 'Television'},
      ],
      trackingTypeMaps = [
        {'id': 'TR', 'name': 'Auto'},
        {'id': 'MA', 'name': 'Manual'},
        {'id': 'TA', 'name': 'Tracked'},
        {'id': 'HA', 'name': 'Handled'},
      ],
      allFiltersMaps = [
        {"id": "HC", "name": "High Priority"},
        {"id": "MC", "name": "Mid Priority"},
        {"id": "LC", "name": "Low Priority"},
        {"id": "COM", "name": "Complainant"},
        {"id": "RSP", "name": "Respondent"},
        {"id": "HAD", "name": "Has Document"},
        {"id": "HND", "name": "Haven't Document"},
        {"id": "LA", "name": "Lawyer Assigned"},
        {"id": "LU", "name": "Lawyer Unassigned"},
        {"id": "UA", "name": "Upcoming Activity"},
        {"id": "UH", "name": "Upcoming Hearing"},
        {"id": "OA", "name": "OverDue Activity"},
        {"id": "OH", "name": "OverDue Hearing"},
        {"id": "NA", "name": "No Activties"},
        {"id": "NH", "name": "No Hearing"},
        {"id": "TR", "name": "Ticket Raised"},
        {"id": "CE", "name": "Not Tagged"},
        {"id": "ND", "name": "No DOF"},
        {"id": "ORD", "name": "Latest"},
        {"id": "CB", "name": "Case By"},
        {"id": "CA", "name": "Case Against"},
        {"id": "PR", "name": "Probable Liability"},
        {"id": "PO", "name": "Possible Liability"},
        {"id": "RE", "name": "Remote Liability"},
        {"id": "CP", "name": "Comply"},
        {"id": "CD", "name": "Complied"},
        {"id": "NCD", "name": "Not Complied"},
        {"id": "AP", "name": "Appeal"},
        {"id": "NDOHNA", "name": "NDOH Not Assigned"},
        {"id": "RL", "name": "Respondent Lawyer Empt"}
      ],
      locationsEngagedMaps = [
        {"name": "Delhi", "id": "Delhi"},
        {"name": "Vadodara", "id": "Vadodara"},
        {"name": "Chennai", "id": "Chennai"},
        {"name": "Alwar", "id": "Alwar"},
        {"name": "Godhra", "id": "Godhra"},
        {"name": "Bengaluru", "id": "Bengaluru"},
        {"name": "Lucknow", "id": "Lucknow"},
        {"name": "Kolkata", "id": "Kolkata"},
        {"name": "Palanpur", "id": "Palanpur"},
        {"name": "Nadiad", "id": "Nadiad"},
        {"name": "Ernakulam", "id": "Ernakulam"},
        {"name": "Hyderabad", "id": "Hyderabad"},
        {"name": "Rajkot", "id": "Rajkot"},
        {"name": "Botad", "id": "Botad"},
        {"name": "Jamnagar", "id": "Jamnagar"},
        {"name": "Ahmedabad", "id": "Ahmedabad"},
        {"name": "Udaipur", "id": "Udaipur"},
        {"name": "Veraval", "id": "Veraval"},
        {"name": "Vijayapura", "id": "Vijayapura"},
        {"name": "Greater Noida", "id": "Greater Noida"},
        {"name": "Hisar", "id": "Hisar"},
        {"name": "Indore", "id": "Indore"},
        {"name": "Jaipur", "id": "Jaipur"},
        {"name": "Junagadh", "id": "Junagadh"},
        {"name": "Jyotiba Phule Nagar", "id": "Jyotiba Phule Nagar"},
        {"name": "Karimnagar", "id": "Karimnagar"},
        {"name": "Kasganj", "id": "Kasganj"},
        {"name": "Khambhaliya", "id": "Khambhaliya"},
        {"name": "Kheda", "id": "Kheda"},
        {"name": "Kollam", "id": "Kollam"},
        {"name": "Kottayam", "id": "Kottayam"},
        {"name": "Kutch", "id": "Kutch"},
        {"name": "Lunavada", "id": "Lunavada"},
        {"name": "Malda", "id": "Malda"},
        {"name": "Meerut", "id": "Meerut"},
        {"name": "Modasa", "id": "Modasa"},
        {"name": "Morbi", "id": "Morbi"},
        {"name": "Navsari", "id": "Navsari"},
        {"name": "Panchkula", "id": "Panchkula"},
        {"name": "Patna", "id": "Patna"},
        {"name": "Penukonda", "id": "Penukonda"},
        {"name": "Radhanpur", "id": "Radhanpur"},
        {"name": "Sabarkantha", "id": "Sabarkantha"},
        {"name": "Salem", "id": "Salem"},
        {"name": "Sangrur", "id": ""},
        {"name": "Shamli", "id": "Shamli"},
        {"name": "Solapur", "id": ""},
        {"name": "Surat", "id": "Surat"},
        {"name": "Surendranagar", "id": ""},
        {"name": "Thane", "id": "Thane"},
        {"name": "Thrissur", "id": "Thrissur"},
        {"name": "Vikarabad", "id": "Vikarabad"},
        {"name": "Warangal", "id": "Warangal"},
        {"name": "Yavatmal", "id": "Yavatmal"},
        {"name": "Thanjavur", "id": "Thanjavur"},
        {"name": "Alipurduar", "id": "Alipurduar"},
        {"name": "Allahabad", "id": "Allahabad"},
        {"name": "Almora", "id": "Almora"},
        {"name": "Amreli", "id": "Amreli"},
        {"name": "Anakapalle", "id": "Anakapalle"},
        {"name": "Anand", "id": "Anand"},
        {"name": "Bankura", "id": "Bankura"},
        {"name": "Basti", "id": "Basti"},
        {"name": "Bathinda", "id": "Bathinda"},
        {"name": "Bhavnagar", "id": "Bhavnagar"},
        {"name": "Bhuj", "id": "Bhuj"},
        {"name": "Chhindwara", "id": "Chhindwara"},
        {"name": "Chhota Udepur", "id": "Chhota Udepur"},
        {"name": "Cuttack", "id": "Cuttack"},
        {"name": "Dinajpur", "id": "Dinajpur"},
        {"name": "Durg", "id": "Durg"},
        {"name": "Dwarka", "id": "Dwarka"},
        {"name": "Gokak", "id": "Gokak"},
      ],
      stageMaps = [];

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
          managersMaps =
              context.watch<AllCasesFiltersBloc>().state.case_manager!;
          stateMaps = context.watch<AllCasesFiltersBloc>().state.state_filters!;
          stageMaps = context.watch<AllCasesFiltersBloc>().state.case_stage!;
          courtMaps = context.watch<AllCasesFiltersBloc>().state.court!;
          typeMaps = context.watch<AllCasesFiltersBloc>().state.case_type!;

          List<String>? caseManagers = ['By Case Manager'];
          caseManagerController.text = 'By Case Manager';
          context
              .watch<AllCasesFiltersBloc>()
              .state
              .case_manager
              ?.forEach((element) {
            caseManagers.add(element['name']);
          });

          List<String>? caseType = ['By Case Type'];
          caseTypeController.text = 'By Case Type';
          context
              .watch<AllCasesFiltersBloc>()
              .state
              .case_type
              ?.forEach((element) {
            caseType.add(element['name']);
          });

          List<String>? courts = ['By Court'];
          courtController.text = 'By Court';
          context.watch<AllCasesFiltersBloc>().state.court?.forEach((element) {
            courts.add(element['name']);
          });

          List<String>? states = ['By State'];
          stateController.text = 'By State';
          context
              .watch<AllCasesFiltersBloc>()
              .state
              .state_filters
              ?.forEach((element) {
            states.add(element['name']);
          });

          List<String>? caseStage = ['By Case Stage'];
          caseStageController.text = 'By Case Stage';
          context
              .watch<AllCasesFiltersBloc>()
              .state
              .case_stage
              ?.forEach((element) {
            caseStage.add(element['name']);
          });
          List<String>? regions = ['By Region'];
          regionController.text = 'By Region';
          regionMaps.forEach((element) {
            regions.add(element['name']);
          });

          List<String>? caseStatus = ['By Case Status'];
          statusController.text = 'By Case Status';
          statusMaps.forEach((element) {
            caseStatus.add(element['name']);
          });
          List<String>? orderTypes = ['By Order Type'];
          orderTypeController.text = 'By Order Type';
          orderTypeMaps.forEach((element) {
            orderTypes.add(element['name']);
          });
          List<String>? locations = ['By Location Engaged'];
          locationsEngagedController.text = 'By Location Engaged';
          locationsEngagedMaps.forEach((element) {
            locations.add(element['name']);
          });
          List<String>? amounts = ['By Amount Claimed'];
          amountClaimedController.text = 'By Amount Claimed';
          amountClaimedMaps.forEach((element) {
            amounts.add(element['name']);
          });
          List<String>? winEstimates = ['By Win Estimate'];
          winEstimateController.text = 'By Win Estimate';
          winEstimateMaps.forEach((element) {
            winEstimates.add(element['name']);
          });
          List<String>? counsels = ['By Counsels Engaged'];
          counselsEngagedController.text = 'By Counsels Engaged';
          counselsEngagedMaps.forEach((element) {
            counsels.add(element['name']);
          });
          List<String>? brands = ['By Brands Involved'];
          brandsController.text = 'By Brands Involved';
          brandsMaps.forEach((element) {
            brands.add(element['name']);
          });
          List<String>? products = ['By Product Wise Complaints'];
          productsController.text = 'By Product Wise Complaints';
          productsMaps.forEach((element) {
            products.add(element['name']);
          });
          List<String>? allFilters = ['All Filters'];
          allFiltersController.text = 'All Filters';
          allFiltersMaps.forEach((element) {
            allFilters.add(element['name']);
          });
          List<String>? trackingTypes = ['By Tracking Type'];
          trackingTypeController.text = 'By Tracking Type';
          trackingTypeMaps.forEach((element) {
            trackingTypes.add(element['name']);
          });

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
                    AppDropdown('By Case Type', caseType, caseTypeController,
                        'By Case Type'),
                    AppDropdown('By Case Stage', caseStage, caseStageController,
                        'By Case Stage'),
                    AppDropdown(
                        'By Court', courts, courtController, 'By Court'),
                    AppDropdown(
                        'By Region', regions, regionController, 'By Region'),
                    AppDropdown('By Case Status', caseStatus, statusController,
                        'By Case Status'),
                    AppDropdown('By Case Manager', caseManagers,
                        caseManagerController, 'By Case Manager'),
                    AppDropdown('By Order Type', orderTypes,
                        orderTypeController, 'By Order Type'),
                    AppDropdown('By Location Engaged', locations,
                        locationsEngagedController, 'By Location Engaged'),
                    AppDropdown('By Amount Claimed', amounts,
                        amountClaimedController, 'By Amount Claimed'),
                    AppDropdown('By Win Estimate', winEstimates,
                        winEstimateController, 'By Win Estimate'),
                    AppDropdown('By Counsels Engaged', counsels,
                        counselsEngagedController, 'By Counsels Engaged'),
                    AppDropdown('By Brands Involved', brands, brandsController,
                        'By Brands Involved'),
                    AppDropdown('By Product Wise Complaints', products,
                        productsController, 'By Product Wise Complaints'),
                    AppDropdown(
                        'By State', states, stateController, 'By State'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                // width: getProportionateScreenWidth(320),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              activeStart = true;
                              active = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: AppColors.primary.withOpacity(0.05),
                                  spreadRadius: 1,
                                  blurRadius: 5)
                            ]),
                            child: Card(
                              // elevation: 3,
                              // shadowColor: AppColors.primary,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(11),
                                child: Row(
                                  children: [
                                    Container(
                                      width: getProportionateScreenWidth(108),
                                      child: Text(
                                        'By Hearing Date(F)',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                                color: !activeStart
                                                    ? AppColors.appGrey
                                                    : Colors.black,
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        13)),
                                      ),
                                    ),
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
                      SizedBox(
                        width: 15,
                        child: Center(
                          child: Text('~',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: AppColors.appGrey)),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              active = true;
                              activeStart = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: AppColors.primary.withOpacity(0.05),
                                  spreadRadius: 1,
                                  blurRadius: 5)
                            ]),
                            child: Card(
                              // elevation: 3,
                              // shadowColor: AppColors.primary,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(11),
                                child: Row(
                                  children: [
                                    Container(
                                      width: getProportionateScreenWidth(108),
                                      child: Text(
                                        'By Hearing Date(U)',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                                color: !active
                                                    ? AppColors.appGrey
                                                    : Colors.black,
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        12)),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      AppIcons.calendar2,
                                      color: !active
                                          ? AppColors.tertiary
                                          : AppColors.primary,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 5),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 4,
                            mainAxisSpacing: 10),
                    children: [
                      AppDropdown('All Filters', allFilters,
                          allFiltersController, 'All Filters'),
                      AppDropdown('By Tracking Type', trackingTypes,
                          trackingTypeController, 'By Tracking Type'),
                    ],
                  ),
                ),
              ),
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
                          caseTypeController.clear();
                          caseManagerController.clear();
                          courtController.clear();
                          caseStageController.clear();
                          stateController.clear();
                          context
                              .read<AllCasesBloc>()
                              .add(AllCasesGetInitialCases());
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
                          //     .watch<AllCasesFiltersBloc>()
                          //     .state
                          //     .filter_activated!;
                          return InkWell(
                            onTap: () async {
                              context
                                  .read<AllCasesBloc>()
                                  .add(AllCasesRefreshing());
                              setState(() {
                                managersMaps.forEach((element) {
                                  if (element['name'] ==
                                      caseManagerController.text)
                                    manager = element['id'];
                                });
                                typeMaps.forEach((element) {
                                  if (element['name'] ==
                                      caseTypeController.text)
                                    type = element['id'];
                                });
                                courtMaps.forEach((element) {
                                  if (element['name'] == courtController.text)
                                    court = element['id'];
                                });
                                stageMaps.forEach((element) {
                                  if (element['name'] ==
                                      caseStageController.text)
                                    stage = element['id'];
                                });
                                stateMaps.forEach((element) {
                                  if (element['name'] == stateController.text)
                                    state = element['id'];
                                });

                                regionMaps.forEach((element) {
                                  if (element['name'] == regionController.text)
                                    region = element['id'];
                                });
                                statusMaps.forEach((element) {
                                  if (element['name'] == statusController.text)
                                    status = element['id'];
                                });
                                orderTypeMaps.forEach((element) {
                                  if (element['name'] ==
                                      orderTypeController.text)
                                    orderType = element['id'];
                                });
                                locationsEngagedMaps.forEach((element) {
                                  if (element['name'] ==
                                      locationsEngagedController.text)
                                    locationEngaged = element['id'];
                                });
                                amountClaimedMaps.forEach((element) {
                                  if (element['name'] ==
                                      amountClaimedController.text)
                                    amountClaimed = element['id'];
                                });
                                winEstimateMaps.forEach((element) {
                                  if (element['name'] ==
                                      winEstimateController.text)
                                    winEstimate = element['id'];
                                });
                                counselsEngagedMaps.forEach((element) {
                                  if (element['name'] ==
                                      counselsEngagedController.text)
                                    counsel = element['id'];
                                });
                                brandsMaps.forEach((element) {
                                  if (element['name'] == brandsController.text)
                                    brand = element['id'];
                                });
                                productsMaps.forEach((element) {
                                  if (element['name'] ==
                                      productsController.text)
                                    product = element['id'];
                                });
                                allFiltersMaps.forEach((element) {
                                  if (element['name'] ==
                                      allFiltersController.text)
                                    allFilter = element['id'];
                                });
                                trackingTypeMaps.forEach((element) {
                                  if (element['name'] ==
                                      trackingTypeController.text)
                                    trackingType = element['id'];
                                });
                              });

                              context
                                  .read<AllCasesBloc>()
                                  .add(AllCasesImplementingFilters());

                              context
                                  .read<AllCasesBloc>()
                                  .add(AllCasesGetFilteredResults(
                                    title: titleController.text,
                                    type: type,
                                    state: state,
                                    court: court,
                                    stage: stage,
                                    manager: manager,
                                    region: region,
                                    status: status,
                                    orderType: orderType,
                                    location: locationEngaged,
                                    amount: amountClaimed,
                                    winEstimate: winEstimate,
                                    counsel: counsel,
                                    brand: brand,
                                    product: product,
                                    allFilter: allFilter,
                                    tracking: trackingType,
                                  ));
                              context
                                  .read<AllCasesBloc>()
                                  .add(AllCasesFiltersImplemented());
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
                                child: context.watch<AllCasesBloc>().state
                                        is AllCasesImplementingFilters
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
