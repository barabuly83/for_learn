class Contact {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String position;
  final String avatarColor;

  const Contact({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.position,
    required this.avatarColor,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      position: json['position'] as String,
      avatarColor: json['avatarColor'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'position': position,
      'avatarColor': avatarColor,
    };
  }

  Contact copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? position,
    String? avatarColor,
  }) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      position: position ?? this.position,
      avatarColor: avatarColor ?? this.avatarColor,
    );
  }

  @override
  String toString() {
    return 'Contact(id: $id, name: $name, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Contact &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.position == position &&
        other.avatarColor == avatarColor;
  }

  @override
  int get hashCode {
    return Object.hash(id, name, email, phone, position, avatarColor);
  }
}