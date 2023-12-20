class ReqOTPParams {
  String? uid;
  String? pass;

  ReqOTPParams(this.uid, this.pass);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid ?? "";
    data['password'] = pass ?? "";
    data['type'] = "chpass";
    data['onmobile'] = "1";
    return data;
  }
}

class ChgPwdParams {
  String? uid;
  String? oldP;
  String? newP;
  String? otp;

  ChgPwdParams(this.uid, this.oldP, this.newP, this.otp);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid ?? "";
    data['passwordlama'] = oldP ?? "";
    data['passwordbaru'] = newP ?? "";
    data['otp'] = otp ?? "";
    data['onmobile'] = "1";
    return data;
  }
}
