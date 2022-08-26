import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/logic/bloc/add_hearing_bloc/add_hearing_bloc.dart';
import 'package:tip100/logic/bloc/add_lawyer_bloc/add_lawyer_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_details_bloc/all_cases_details_repository.dart';
import 'package:tip100/logic/bloc/all_cases_filters_bloc/all_cases_filters_repository.dart';
import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_repository.dart';
import 'package:tip100/logic/bloc/case_explorer_bloc/case_explorer_bloc.dart';
import 'package:tip100/logic/bloc/case_explorer_bloc/case_explorer_repository.dart';
import 'package:tip100/logic/bloc/case_explorer_details_bloc/case_explorer_details_bloc.dart';
import 'package:tip100/logic/bloc/case_explorer_details_bloc/case_explorer_details_repository.dart';
import 'package:tip100/logic/bloc/cause_list_filters_bloc/cause_list_filters_bloc.dart';
import 'package:tip100/logic/bloc/cause_list_filters_bloc/cause_list_filters_repository.dart';
import 'package:tip100/logic/bloc/cause_list_free_text_bloc/cause_list_free_text_repository.dart';
import 'package:tip100/logic/bloc/cause_list_pdf_bloc/cause_list_pdf_repository.dart';
import 'package:tip100/logic/bloc/daily_orders_bloc/daily_orders_bloc.dart';
import 'package:tip100/logic/bloc/daily_orders_bloc/daily_orders_repository.dart';
import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_repository.dart';
import 'package:tip100/logic/bloc/judgements_bloc/judgements_bloc.dart';
import 'package:tip100/logic/bloc/judgements_bloc/judgements_repository.dart';
import 'package:tip100/logic/bloc/my_counsel_bloc/my_counsel_bloc.dart';
import 'package:tip100/logic/bloc/my_counsel_bloc/my_counsel_repository.dart';
import 'package:tip100/logic/bloc/my_counsel_details_bloc/my_counsel_details_bloc.dart';
import 'package:tip100/logic/bloc/my_counsel_details_bloc/my_counsel_details_repository.dart';
import 'package:tip100/logic/cubit/switch_cubit.dart';
import 'package:tip100/screens/entrypoint/entrypoint_ui.dart';
import 'package:tip100/screens/home/components/chat_page.dart';
import 'package:tip100/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'languages/local_constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/themes/app_themes.dart';
import 'languages/localization_delegates.dart';
import 'logic/bloc/all_cases_filters_bloc/all_cases_filters_bloc.dart';
import 'logic/bloc/cause_list_free_text_bloc/cause_list_free_text_bloc.dart';
import 'logic/bloc/cause_list_pdf_bloc/cause_list_pdf_bloc.dart';
import 'logic/bloc/singin_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await StreamingSharedPreferences.instance;
  // preferences.setString('token', ' ');
  await Firebase.initializeApp();
  runApp(MyApp(
    pref: preferences,
  ));
}

class MyApp extends StatefulWidget {
  SharedPreferences? prefs;
  StreamingSharedPreferences? pref;
  MyApp({this.pref, Key? key}) : super(key: key);



  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale =  Locale('en', '');
  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  FirebaseFirestore? firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage? firebaseStorage = FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SigninRepository>(
          create: (context) => SigninRepository(),
        ),
        RepositoryProvider<AllCasesRepository>(
          create: (context) => AllCasesRepository(),
        ),
        RepositoryProvider<MyCounselRepository>(
          create: (context) => MyCounselRepository(),
        ),
        RepositoryProvider<AllCasesFiltersRepository>(
          create: (context) => AllCasesFiltersRepository(),
        ),
        RepositoryProvider<BasicGraphsRepository>(
          create: (context) => BasicGraphsRepository(),
        ),
        RepositoryProvider<CaseExplorerDetailsRepository>(
          create: (context) => CaseExplorerDetailsRepository(),
        ),
        RepositoryProvider<CaseExplorerRepository>(
          create: (context) => CaseExplorerRepository(),
        ),
        RepositoryProvider<CauseListPDFRepository>(
          create: (context) => CauseListPDFRepository(),
        ),
        RepositoryProvider<CauseListFreeTextRepository>(
          create: (context) => CauseListFreeTextRepository(),
        ),
        RepositoryProvider<JudgementsRepository>(
          create: (context) => JudgementsRepository(),
        ),
        RepositoryProvider<DailyOrdersRepository>(
          create: (context) => DailyOrdersRepository(),
        ),
        RepositoryProvider<AllCasesDetailsRepository>(
          create: (context) => AllCasesDetailsRepository(),
        ),
        RepositoryProvider<CauseListFiltersRepository>(
          create: (context) => CauseListFiltersRepository(),
        ),
        RepositoryProvider<MyCounselDetailsRepository>(
          create: (context) => MyCounselDetailsRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SwitchCubit>(
            create: (context) => SwitchCubit(),
            lazy: false,
          ),
          // BlocProvider<MessageCubit>(
          //   create: (context) => MessageCubit(
          //     repository: AnnouncementsRepository(
          //       Dio(),
          //     ),
          //   ),
          //   lazy: false,
          // ),
          //
          BlocProvider<AllCasesBloc>(
            create: (context) => AllCasesBloc(
                allCasesRepository: context.read<AllCasesRepository>()),
            lazy: false,
          ),
          BlocProvider<AddHearingBloc>(
            create: (context) => AddHearingBloc(),
            lazy: false,
          ),
          BlocProvider<CaseExplorerBloc>(
            create: (context) => CaseExplorerBloc(
                caseExplorerRepository: context.read<CaseExplorerRepository>()),
            lazy: false,
          ),
          BlocProvider<MyCounselDetailsBloc>(
            create: (context) => MyCounselDetailsBloc(
                myCounselDetailsRepository:
                    context.read<MyCounselDetailsRepository>()),
            lazy: false,
          ),
          BlocProvider<CaseExplorerDetailsBloc>(
            create: (context) => CaseExplorerDetailsBloc(
                caseExplorerDetailsRepository:
                    context.read<CaseExplorerDetailsRepository>()),
            lazy: false,
          ),
          BlocProvider<MyCounselBloc>(
            create: (context) => MyCounselBloc(
                myCounselRepository: context.read<MyCounselRepository>()),
            lazy: false,
          ),
          BlocProvider<BasicGraphsBloc>(
            create: (context) => BasicGraphsBloc(
                basicGraphsRepository: context.read<BasicGraphsRepository>()),
            lazy: false,
          ),
          BlocProvider<CauseListPDFBloc>(
            create: (context) => CauseListPDFBloc(
                causeListPDFRepository: context.read<CauseListPDFRepository>()),
            lazy: false,
          ),
          BlocProvider<CauseListFreeTextBloc>(
            create: (context) => CauseListFreeTextBloc(
                causeListFreeTextRepository:
                    context.read<CauseListFreeTextRepository>()),
            lazy: false,
          ),
          BlocProvider<AddCaseBloc>(
            create: (context) => AddCaseBloc(),
            lazy: false,
          ),
          BlocProvider<AddLawyerBloc>(
            create: (context) => AddLawyerBloc(),
            lazy: false,
          ),
          BlocProvider<AllCasesFiltersBloc>(
            create: (context) => AllCasesFiltersBloc(
                allCasesFiltersRepository:
                    context.read<AllCasesFiltersRepository>()),
            lazy: false,
          ),
          BlocProvider<JudgementsBloc>(
            create: (context) => JudgementsBloc(
                judgementsRepository: context.read<JudgementsRepository>()),
            lazy: false,
          ),
          BlocProvider<DailyOrdersBloc>(
            create: (context) => DailyOrdersBloc(
                dailyOrdersRepository: context.read<DailyOrdersRepository>()),
            lazy: false,
          ),
          BlocProvider<AllCasesDetailsBloc>(
            create: (context) => AllCasesDetailsBloc(
                allCasesDetailsRepository:
                    context.read<AllCasesDetailsRepository>()),
            lazy: false,
          ),
          BlocProvider<CauseListFiltersBloc>(
            create: (context) => CauseListFiltersBloc(
                causeListFiltersRepository:
                    context.read<CauseListFiltersRepository>()),
            lazy: false,
          ),
          //
          // BlocProvider<SettingsBloc>(
          //   create: (context) => SettingsBloc(
          //       settingsRepository: context.read<SettingsRepository>()),
          //   lazy: false,
          // ),
        ],
        child: MultiProvider(
          providers: [
            Provider<ChatProvider>(
                create: (_) => ChatProvider(
                    firebaseStorage: firebaseStorage!,
                    firebaseFirestore: firebaseFirestore!))
          ],

        child: MaterialApp(
          locale: _locale,
          supportedLocales: const [Locale('en', ''), Locale('ta', '')],
          localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale?.languageCode == locale?.languageCode &&
                  supportedLocale?.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales?.first;
          },
          title: 'TIP100',
          theme: AppThemes.light,
          home:  EntryPointUI(
           pref: widget.pref,
  ),
        ),
      ),
    ));
  }
}
