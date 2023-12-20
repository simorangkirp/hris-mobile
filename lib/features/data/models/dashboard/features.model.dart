class FeaturesModel {
  String? iconPath;
  String? text;
  String? route;

  FeaturesModel({
    this.iconPath,
    this.text,
    this.route,
  });
}

class RemoteDashboardParams {
  String? uid;
  RemoteDashboardParams(this.uid);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid ?? "";
    data['onmobile'] = "1";
    return data;
  }
}
