class Contact {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String position;

  Contact({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.position,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'position': position,
    };
  }
}
