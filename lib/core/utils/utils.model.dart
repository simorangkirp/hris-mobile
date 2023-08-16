class MonthModel {
  int? index;
  String? name;
  bool? isSelected;
  MonthModel(
    this.index,
    this.name,
    this.isSelected,
  );

  // List<MonthModel> list() {
  //   final
  //   return list;
  // }
}

class ErrMsg {
  int? status;
  int? error;
  Messages? messages;

  ErrMsg({
    this.status,
    this.error,
    this.messages,
  });

  ErrMsg.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    messages =
        json['messages'] != null ? Messages.fromJson(json['messages']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['error'] = error;
    if (messages != null) {
      data['messages'] = messages!.toJson();
    }
    return data;
  }
}

class Messages {
  String? error;

  Messages({
    this.error,
  });

  Messages.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['error'] = error;
    return data;
  }
}
