import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_illustrations.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/logic/bloc/case_explorer_details_bloc/case_explorer_details_bloc.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/tasks/components/tasks_header.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/internal_pages/orders/components/orders_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'components/orders_card.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => OrdersPageState();
}

class OrdersPageState extends State<OrdersPage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  VoidCallback? _showPersistantBottomSheetCallBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.tertiary,
      body: SafeArea(
        child: context.watch<CaseExplorerDetailsBloc>().state.loading == true
            ? Container(
                color: AppColors.offWhite,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            : context
                        .watch<CaseExplorerDetailsBloc>()
                        .state
                        .caseDetails!
                        .orders!
                        .length ==
                    0
                ? Container(
                    color: AppColors.offWhite,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        OrdersHeader(),
                        Expanded(
                          child: Center(
                            child: Text('No Orders Listed'),
                          ),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Container(
                      color: AppColors.offWhite,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrdersHeader(),
                          Expanded(
                            child: SizedBox(
                              // width: MediaQuery.of(context).size.width * 0.9,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: context
                                      .watch<CaseExplorerDetailsBloc>()
                                      .state
                                      .caseDetails!
                                      .orders!
                                      .length,
                                  itemBuilder: (context, index) => index ==
                                          context
                                                  .watch<
                                                      CaseExplorerDetailsBloc>()
                                                  .state
                                                  .caseDetails!
                                                  .orders!
                                                  .length -
                                              1
                                      ? Padding(
                                          padding: EdgeInsets.only(bottom: 30),
                                          child: OrdersCard(
                                              orderDetails: context
                                                  .watch<
                                                      CaseExplorerDetailsBloc>()
                                                  .state
                                                  .caseDetails!
                                                  .orders![index]),
                                        )
                                      : OrdersCard(
                                          orderDetails: context
                                              .watch<CaseExplorerDetailsBloc>()
                                              .state
                                              .caseDetails!
                                              .orders![index],
                                        )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
