class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? imageUrl;
  late DateTime lastActive;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.lastActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        name: json['name'],
        email: json['email'],
        imageUrl: json['image'],
        lastActive: json['lastActive'].toDate(),
      );

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'lastActive': lastActive,
    };
  }

  String lastDayActive() =>
      "${lastActive.day}/${lastActive.month}/${lastActive.year}";

  bool wasRecentlyActive() => DateTime.now().difference(lastActive).inHours < 2;
}
