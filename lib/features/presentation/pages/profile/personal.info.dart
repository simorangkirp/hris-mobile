import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owl_hris/lib.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class MyPersonalInfoScreen extends StatefulWidget {
  const MyPersonalInfoScreen({super.key});

  @override
  State<MyPersonalInfoScreen> createState() => _MyPersonalInfoScreenState();
}

class _MyPersonalInfoScreenState extends State<MyPersonalInfoScreen> {
  final ctrl = PageController(
    initialPage: 0,
  );

  JobEntity? jobModel;
  EntityProfile? profileModel;
  FamilyEntity? familyModel;
  EmerContactEntity? emCtcModel;
  EducationEntity? eduModel;
  AddressEntity? addressModel;
  PayrollEntity? payrollModel;

  void dispatchGetProfileInfo() {
    BlocProvider.of<ProfileScreenBloc>(context)
        .add(GetProfileInfoProfileScreen());
  }

  void dispatchGetJobHistory() {
    BlocProvider.of<ProfileScreenBloc>(context).add(ProfileScrnGetJobHistory());
  }

  void dispatchGetEmContact() {
    BlocProvider.of<ProfileScreenBloc>(context).add(ProfileScrnGetEmerCtc());
  }

  void dispatchGetFamilyInfo() {
    BlocProvider.of<ProfileScreenBloc>(context).add(ProfileScrnGetFamily());
  }

  void dispatchGetEducationInfo() {
    BlocProvider.of<ProfileScreenBloc>(context).add(ProfileScrnGetEdu());
  }

  void dispatchGetAddressInfo() {
    BlocProvider.of<ProfileScreenBloc>(context).add(ProfileScrnGetAddress());
  }

  void dispatchGetPayrollInfo() {
    BlocProvider.of<ProfileScreenBloc>(context).add(ProfileScrnGetPayroll());
  }

  @override
  void initState() {
    dispatchGetProfileInfo();
    super.initState();
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.myPersonalInfo),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocListener<ProfileScreenBloc, ProfileScreenState>(
          listener: (context, state) {
            if (state is ProfileInfoLoaded) {
              profileModel = state.profile;
              dispatchGetJobHistory();
            }
            if (state is ProfileScrnGetJobHistoryLoaded) {
              jobModel = state.jobEntity;
              dispatchGetEmContact();
            }
            if (state is ProfileScrnGetEmerCtcLoaded) {
              emCtcModel = state.emerCtcEntity;
              dispatchGetFamilyInfo();
            }
            if (state is ProfileScrnGetFamilyLoaded) {
              familyModel = state.familyEntity;
              dispatchGetEducationInfo();
            }
            if (state is ProfileScrnGetEduLoaded) {
              eduModel = state.eduEntity;
              dispatchGetAddressInfo();
            }
            if (state is ProfileScrnGetAddressLoaded) {
              addressModel = state.address;
              dispatchGetPayrollInfo();
            }
            if (state is ProfileScrnGetPayrollLoaded) {
              payrollModel = state.payroll;
            }
          },
          child: BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
            builder: (context, state) {
              return PageView(
                scrollDirection: Axis.horizontal,
                controller: ctrl,
                children: <Widget>[
                  detailInfo(context, profileModel),
                  jobHistory(context, jobModel),
                  familyInfo(context, familyModel),
                  emCtcInfo(context, emCtcModel),
                  educationInfo(context, eduModel),
                  addressInfo(context, addressModel),
                  payrollInfo(context, payrollModel),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
