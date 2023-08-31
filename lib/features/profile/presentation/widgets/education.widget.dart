import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owl_hris/lib.dart';

Widget educationInfo(EducationEntity? model) {
  ScrollController ctrl = ScrollController();
  return SingleChildScrollView(
    controller: ctrl,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 4.h),
          Text(
            'Education history',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: appBgBlack.withOpacity(0.7),
            ),
          ),
          model != null
              ? model.dataDetails!.isNotEmpty
                  ? ListView.builder(
                      controller: ctrl,
                      shrinkWrap: true,
                      itemCount: model.dataDetails!.length,
                      itemBuilder: (context, index) {
                        var item = model.dataDetails![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: buildEduItem(item),
                        );
                      },
                    )
                  : const SizedBox()
              : const SizedBox(),
        ],
      ),
    ),
  );
}

buildEduItem(EducationDetails data) {
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
                    'Nama sekolah',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: appBgBlack.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    data.namasekolah ?? "-",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
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
                    'Spesialisasi',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: appBgBlack.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    data.spesialisasi ?? "-",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
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
                    'Gelar',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: appBgBlack.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    data.gelar ?? "-",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
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
                    'Tahun lulus',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: appBgBlack.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    data.tahunlulus ?? "-",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
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
                    'Nilai',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: appBgBlack.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    data.nilai ?? "-",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
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
                    'Kota',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: appBgBlack.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    data.kota ?? "-",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 12.h),
    ],
  );
}
