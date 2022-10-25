// {
// "id": "cl9gpjzff00013ax4deebjtdy",
// "name": "Bari",
// "email": "ts741127@gmail.com",
// "phone": "9641831706"
// }

class EmergencyContact{
  final String id;
  final String name;
  final String email;
  final String phone;

  EmergencyContact({required this.id, required this.name, required this.email, required this.phone});

  factory EmergencyContact.fromJson(Map<String, dynamic> json) {
    return EmergencyContact(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
  };
}