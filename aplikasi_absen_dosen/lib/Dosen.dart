class Dosen {
  String? email;
  String? username;
  String? pass;

  Dosen({this.email, this.username, this.pass,});

  factory Dosen.fromJson(Map<String, dynamic> json) => Dosen(
    email: json['email'],
    username: json['username'],
    pass: json['pass'],
  );

  Map<String, dynamic> toJson() => {
    "email":email,
    "username":username,
    "pass":pass,
  };
}