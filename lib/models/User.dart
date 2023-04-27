class User{
  final String? firstname , lastname , email , password  ;
  final num? id;
  final Object? userInfo;



  const User({
    required this.firstname,
    required this.lastname,
    required this.email,
    this.password,
    required this.id,
    this.userInfo,

  });




}