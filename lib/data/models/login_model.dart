class LoginModel {
  String? message;
  bool? isSuccess;
  Response? response;

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isSuccess = json['isSuccess'];
    response = Response.fromJson(json['response']);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['isSuccess'] = isSuccess;
    _data['response'] = response?.toJson();
    return _data;
  }
}

class Response {
  List<dynamic>? result;
  List<dynamic>? visits;
  List<dynamic>? msShooperData;
  User? user;

  Response.fromJson(Map<String, dynamic> json) {
    result = List.castFrom<dynamic, dynamic>(json['result']);
    visits = List.castFrom<dynamic, dynamic>(json['visits']);
    msShooperData = List.castFrom<dynamic, dynamic>(json['msShooperData']);
    user = User.fromJson(json['user']);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result;
    _data['visits'] = visits;
    _data['msShooperData'] = msShooperData;
    _data['user'] = user?.toJson();
    return _data;
  }
}

class User {
  String? loginTime;
  int? userId;
  String? userEmail;
  String? fullName;
  String? userImage;
  String? userTelephone;
  String? token;
  String? refreshToken;
  String? agencyName;
  String? agencyLogo;
  List<AgencyLanguage>? agencyLanguage;
  List<dynamic>? agencyModules;
  List<dynamic>? listOfMissedVisitReasons;
  List<dynamic>? agencyProjects;
  List<dynamic>? userHelpFiles;
  String? greetingMsg;
  List<GreetingMsgLanguages>? greetingMsgLanguages;
  int? agencyID;

  User.fromJson(Map<String, dynamic> json) {
    loginTime = json['loginTime'];
    userId = json['userId'];
    userEmail = json['userEmail'];
    fullName = json['fullName'];
    userImage = json['userImage'];
    userTelephone = json['userTelephone'];
    token = json['token'];
    refreshToken = json['refreshToken'];
    agencyName = json['agencyName'];
    agencyLogo = json['agencyLogo'];
    agencyLanguage = List.from(json['agencyLanguage'])
        .map((e) => AgencyLanguage.fromJson(e))
        .toList();
    agencyModules = List.castFrom<dynamic, dynamic>(json['agencyModules']);
    listOfMissedVisitReasons =
        List.castFrom<dynamic, dynamic>(json['listOfMissedVisitReasons']);
    agencyProjects = List.castFrom<dynamic, dynamic>(json['agencyProjects']);
    userHelpFiles = List.castFrom<dynamic, dynamic>(json['userHelpFiles']);
    greetingMsg = json['greetingMsg'];
    greetingMsgLanguages = List.from(json['greetingMsgLanguages'])
        .map((e) => GreetingMsgLanguages.fromJson(e))
        .toList();
    agencyID = json['agencyID'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['loginTime'] = loginTime;
    _data['userId'] = userId;
    _data['userEmail'] = userEmail;
    _data['fullName'] = fullName;
    _data['userImage'] = userImage;
    _data['userTelephone'] = userTelephone;
    _data['token'] = token;
    _data['refreshToken'] = refreshToken;
    _data['agencyName'] = agencyName;
    _data['agencyLogo'] = agencyLogo;
    _data['agencyLanguage'] = agencyLanguage?.map((e) => e.toJson()).toList();
    _data['agencyModules'] = agencyModules;
    _data['listOfMissedVisitReasons'] = listOfMissedVisitReasons;
    _data['agencyProjects'] = agencyProjects;
    _data['userHelpFiles'] = userHelpFiles;
    _data['greetingMsg'] = greetingMsg;
    _data['greetingMsgLanguages'] =
        greetingMsgLanguages?.map((e) => e.toJson()).toList();
    _data['agencyID'] = agencyID;
    return _data;
  }
}

class AgencyLanguage {
  int? langID;
  String? name;

  AgencyLanguage.fromJson(Map<String, dynamic> json) {
    langID = json['langID'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['langID'] = langID;
    _data['name'] = name;
    return _data;
  }
}

class GreetingMsgLanguages {
  int? langID;
  String? name;

  GreetingMsgLanguages.fromJson(Map<String, dynamic> json) {
    langID = json['langID'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['langID'] = langID;
    _data['name'] = name;
    return _data;
  }
}
