/// user_id : 1
/// created_at : "2024-08-08T05:35:01.259995+00:00"
/// full_name : "Rehaman Shaik"
/// last_updated : "2024-08-08T07:09:00.038864+00:00"
/// email : "srehaman234@gmail.com"
/// gender : "male"
/// per_day_cut : 500
/// password : "Rehaman@123"
/// face_login_value : null

class UserModel {
  UserModel({
      num? userId, 
      String? createdAt, 
      String? fullName, 
      String? lastUpdated, 
      String? email, 
      String? gender, 
      num? perDayCut, 
      String? password, 
      double? faceLoginValue,}){
    _userId = userId;
    _createdAt = createdAt;
    _fullName = fullName;
    _lastUpdated = lastUpdated;
    _email = email;
    _gender = gender;
    _perDayCut = perDayCut;
    _password = password;
    _faceLoginValue = faceLoginValue;
}

  UserModel.fromJson(dynamic json) {
    _userId = json['user_id'];
    _createdAt = json['created_at'];
    _fullName = json['full_name'];
    _lastUpdated = json['last_updated'];
    _email = json['email'];
    _gender = json['gender'];
    _perDayCut = json['per_day_cut'];
    _password = json['password'];
    _faceLoginValue = json['face_login_value'];
  }
  num? _userId;
  String? _createdAt;
  String? _fullName;
  String? _lastUpdated;
  String? _email;
  String? _gender;
  num? _perDayCut;
  String? _password;
  double? _faceLoginValue;
UserModel copyWith({  num? userId,
  String? createdAt,
  String? fullName,
  String? lastUpdated,
  String? email,
  String? gender,
  num? perDayCut,
  String? password,
  double? faceLoginValue,
}) => UserModel(  userId: userId ?? _userId,
  createdAt: createdAt ?? _createdAt,
  fullName: fullName ?? _fullName,
  lastUpdated: lastUpdated ?? _lastUpdated,
  email: email ?? _email,
  gender: gender ?? _gender,
  perDayCut: perDayCut ?? _perDayCut,
  password: password ?? _password,
  faceLoginValue: faceLoginValue ?? _faceLoginValue,
);
  num? get userId => _userId;
  String? get createdAt => _createdAt;
  String? get fullName => _fullName;
  String? get lastUpdated => _lastUpdated;
  String? get email => _email;
  String? get gender => _gender;
  num? get perDayCut => _perDayCut;
  String? get password => _password;
  double? get faceLoginValue => _faceLoginValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['created_at'] = _createdAt;
    map['full_name'] = _fullName;
    map['last_updated'] = _lastUpdated;
    map['email'] = _email;
    map['gender'] = _gender;
    map['per_day_cut'] = _perDayCut;
    map['password'] = _password;
    map['face_login_value'] = _faceLoginValue;
    return map;
  }

}