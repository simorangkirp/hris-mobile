import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String convertUint8ListToString(Uint8List uint8list) {
  return String.fromCharCodes(uint8list);
}

class TextCo {
  static TextEditingController init([dynamic text]) {
    return TextEditingController(
        text: (text != null && text != 'null') ? text.toString() : '');
  }
}

String diffDays(DateTimeRange? rg) {
  DateTime? stDt = rg?.start;
  DateTime? enDt = rg?.end;
  String tot = '';
  DateTime? rtrn;
  String comb = '';
  String fStr = '';
  String rtrnStr = '';
  String dtTo = '';
  String dtFr = '';
  String dtRet = '';
  if (stDt == null || enDt == null) return fStr;
  int nbDays = enDt.difference(stDt).inDays + 1;
  List<int> days = List.generate(nbDays, (index) {
    int weekDay = DateTime(stDt.year, stDt.month, stDt.day + (index)).weekday;
    if (weekDay != DateTime.saturday && weekDay != DateTime.sunday) {
      return 1;
    }
    return 0;
  });
  if (enDt.weekday == 5) {
    rtrn = DateTime(enDt.year, enDt.month, enDt.day + 3);
  } else if (enDt.weekday == 6) {
    rtrn = DateTime(enDt.year, enDt.month, enDt.day + 2);
  } else {
    rtrn = DateTime(enDt.year, enDt.month, enDt.day + 1);
  }

  rtrnStr = DateFormat('dd MMMM yyyy').format(rtrn);
  dtRet = DateFormat('yyyy-MM-dd').format(rtrn);

  comb = combineDates(stDt, enDt);
  dtFr = DateFormat('yyyy-MM-dd').format(stDt);
  dtTo = DateFormat('yyyy-MM-dd').format(enDt);
  // mod.tglmulaikerja = DateFormat('yyyy-MM-dd').format(act!);
  // if (act != null) {
  //   mod.tglmulaikerja = DateFormat('yyyy-MM-dd').format(act!);
  // }
  // setState(() {
  tot = days.reduce((a, b) => a + b).toString();
  // dtRange.text =
  //     "${DateFormat('dd MMM yyyy').format(startDt)} - ${DateFormat('dd MMM yyyy').format(endDt)}";
  // mod.returnTxtCo!.text =
  //     DateFormat('dd MMM yyyy').format(act ?? DateTime.now());
  // dtRange.text =
  //     "${days.reduce((a, b) => a + b)}";
  // });
  // mod.jumlahhari = totalDays;
  fStr = "$comb,$tot,$rtrnStr,$dtTo,$dtFr,$dtRet";
  return fStr;
}

Uint8List convertStringToUint8List(String str) {
  final List<int> codeUnits = str.codeUnits;
  final Uint8List unit8List = Uint8List.fromList(codeUnits);

  return unit8List;
}

String combineDates(DateTime start, DateTime end) {
  String date = "";
  if (start.year == end.year) {
    if (start.month == end.month) {
      var month = DateFormat('MMMM').format(start);
      var combine = "${start.day} - ${end.day} $month ${end.year}";
      date = combine;
    }
    if (start.month != end.month) {
      var mStr = DateFormat('MMM').format(start);
      var mEnd = DateFormat('MMM').format(end);
      var combine = "${start.day} $mStr - ${end.day} $mEnd ${end.year}";
      date = combine;
    }
  } else if (start.year != end.year) {
    var mStr = DateFormat('MMM').format(start);
    var mEnd = DateFormat('MMM').format(end);
    var combine =
        "${start.day} $mStr ${start.year} - ${end.day} $mEnd ${end.year}";
    date = combine;
  } else {
    date = "Invalid date";
    return date;
  }
  return date;
}

// String imagepath = " /data/user/img.jpg"; 
// //image path, you can get it with image_picker package

// File imagefile = File(imagepath); //convert Path to File
// Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
// String base64string = base64.encode(imagebytes); //convert bytes to base64 string
// print(base64string); 

// /* Output:
//   /9j/4Q0nRXhpZgAATU0AKgAAAAgAFAIgAAQAAAABAAAAAAEAAAQAAAABAAAJ3
//   wIhAAQAAAABAAAAAAEBAAQAAAABAAAJ5gIiAAQAAAABAAAAAAIjAAQAAAABAAA
//   AAAIkAAQAAAABAAAAAAIlAAIAAAAgAAAA/gEoAA ... long string output
// */
//
//Uint8List decodedbytes = base64.decode(base64string);
//decode base64 stirng to bytes 
// Uint8List byte = Uint8List Uint8List.fromList(List<int> elements);