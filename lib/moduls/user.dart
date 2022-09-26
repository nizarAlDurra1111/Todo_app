class User {
  int? id;
  String? name;
  DateTime? dateOfBirth;
  String? image;

  User({
    this.id,
    this.name,
    this.dateOfBirth,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'image': image,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      dateOfBirth: map['dateOfBirth'] as DateTime,
      image: map['image'] as String,
    );
  }
}
