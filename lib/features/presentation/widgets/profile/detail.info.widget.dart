import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../lib.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


Widget detailInfo(BuildContext context, EntityProfile? model, ThemeData theme) {
  ScrollController ctrl = ScrollController();
  final l10n = AppLocalizations.of(context);

  buildProfileItem(EntityProfile data) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.emplyId,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.nik ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.name,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.namakaryawan ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.ktpNo,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.noktp ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.gender,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.jeniskelamin ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.birthPlace,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.tempatlahir ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.birthDt,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.tanggallahir ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.province,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.provinsi ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.city,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.kota ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.zipCode,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.kodepos ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.address,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.alamataktif ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.maritalSts,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.statusperkawinan ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.religion,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.agama ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.telephone,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.noteleponrumah ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.phone1,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.nohp ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.marriageDt,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.tanggalmenikah ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.noOfChild,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.jumlahanak ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.eduLvl,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.levelpendidikan ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.bloodType,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.golongandarah ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.npwp,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.npwp ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.personalEmail,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.email ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.bpjsNaker,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      data.bpjs ?? "-",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  return SingleChildScrollView(
    controller: ctrl,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 4.h),
          Text(
            l10n.profileInfo,
            style: theme.textTheme.headlineSmall,
          ),
          model != null
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: buildProfileItem(model),
                )
              : const SizedBox(),
        ],
      ),
    ),
  );
}
