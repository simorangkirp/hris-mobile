import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owl_hris/core/core.dart';
import 'package:owl_hris/features/features.dart';

const String baseUrl = 'http://182.23.67.40:8083/officeapi/';

class ConstIconPath {
  static const chevronRight = 'assets/icons/chevron-right.svg';
  static const gallery = 'assets/icons/gallery.svg';
  static const chevronDown = 'assets/icons/chevron-down.svg';
  static const alert = 'assets/icons/alert.svg';
  static const briefcase = 'assets/icons/briefcase.svg';
  static const fileSearch = 'assets/icons/file-search.svg';
  static const handTouch = 'assets/icons/hand-touch.svg';
  static const home = 'assets/icons/home.svg';
  static const notification = 'assets/icons/notification.svg';
  static const profile = 'assets/icons/profile.svg';
  static const settingsCog = 'assets/icons/setting-cogs.svg';
  static const utils = 'assets/icons/utils.svg';
  static const clock = 'assets/icons/clock.svg';
  static const file = 'assets/icons/file.svg';
  static const plane = 'assets/icons/plane.svg';
  static const receipt = 'assets/icons/receipt.svg';
  static const timeOff = 'assets/icons/time-off.svg';
  static const event = 'assets/icons/calendar-heart.svg';
  static const search = 'assets/icons/search.svg';
  static const calendar = 'assets/icons/calendar.svg';
  static const calendarDays = 'assets/icons/calendar-days.svg';
  static const pinLock = 'assets/icons/lock.svg';
  static const passLock = 'assets/icons/pin.svg';
  static const textIcon = 'assets/icons/text.svg';
  static const checkIcon = 'assets/icons/check-icon.svg';
  static const declineIcon = 'assets/icons/decline-icon.svg';
  static const exclamIcon = 'assets/icons/exclam-icon.svg';
  static const questionIcon = 'assets/icons/question-icon.svg';
  static const faceIdIcon = 'assets/icons/face-id-icon.svg';
  static const fingerPrintIcon = 'assets/icons/finger-print-icon.svg';
  static const pinIcon = 'assets/icons/pin-icon.svg';
  static const cameraIcon = 'assets/icons/camera-icon.svg';
  static const fileCross = 'assets/icons/file-cross.svg';
}

class ConstantLottie {
  static const submitLoading = 'assets/lotties/submit_loading.json';
  static const submitSuccess = 'assets/lotties/submit_success.json';
  static const introComplete = 'assets/lotties/intro/complete-intro.json';
  static const introBiometric = 'assets/lotties/intro/biometric-intro.json';
  static const introApproval = 'assets/lotties/intro/approval-intro.json';
  static const introSelfservice = 'assets/lotties/intro/selfservice-intro.json';
  static const introBoost = 'assets/lotties/intro/boost.json';
  static const introNeeds = 'assets/lotties/intro/need.json';
  static const introCollab = 'assets/lotties/intro/collab.json';
}

class ConstantMode {
  static const add = 'ADD';
  static const edit = 'EDIT';
  static const view = 'VIEW';
}

class ConstStatusApproval {
  static KeyVal appWaiting = KeyVal('Waiting', '0');
  static KeyVal appApproved = KeyVal('Approved', '1');
  static KeyVal appDecline = KeyVal('Declined', '2');
  static KeyVal appCorrection = KeyVal('Correction', '3');
}

class Constant {
  static var appPadding = EdgeInsets.symmetric(horizontal: 24.w);
  static var containerPadding =
      EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h);
  static const owlBird = 'assets/image/owl-bird.svg';
  static const pinValid = 'Data Pin Valid!';
  static const dashboardPgNm = 'DashboardPageName';
  static const paidleavePgNm = 'PaidLeavePageName';
  static const profilePgNm = 'ProfilePageName';
  static const absentPgNm = 'AbsentPageName';
  static const ibxNAppPgNm = 'InboxNApprovalPageName';
}

class ConstLang {
  const ConstLang._();
  static const languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'id', value: 'Indonesia'),
  ];
}
