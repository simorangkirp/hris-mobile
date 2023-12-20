class UIDMobileParams {
  String? uid;
  UIDMobileParams(this.uid);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid ?? "";
    data['onmobile'] = "1";
    return data;
  }

  Map<String, dynamic> uidToJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid ?? "";
    return data;
  }

  Map<String, dynamic> notifListParams() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid ?? "";
    data['max'] = "10";
    data['onmobile'] = "1";
    return data;
  }
}

class UIDPeriodParams {
  String? uid;
  String? period;
  UIDPeriodParams(this.uid, this.period);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid ?? "";
    data['periode'] = period ?? "";
    data['onmobile'] = "1";
    return data;
  }
}

class PeriodLocationParams {
  String? period;
  String? loc;
  PeriodLocationParams(this.period, this.loc);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['lokasitugas'] = period ?? "";
    data['tanggal'] = loc ?? "";
    return data;
  }
}
