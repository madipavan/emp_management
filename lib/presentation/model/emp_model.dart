class EmpModel {
  final String createdAt;
  final String name;
  final String avatar;
  final String emailId;
  final String mobile;
  final String country;
  final String state;
  final String district;
  final String id;
  final String position;
  final String department;

  EmpModel({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.emailId,
    required this.mobile,
    required this.country,
    required this.state,
    required this.district,
    required this.id,
    required this.position,
    required this.department,
  });

  factory EmpModel.fromJson(Map emp) {
    return EmpModel(
      createdAt: emp['createdAt'],
      name: emp['name'],
      avatar: emp['avatar'],
      emailId: emp['emailId'],
      mobile: emp['mobile'],
      country: emp['country'],
      state: emp['state'],
      district: emp['district'],
      id: emp['id'],
      position: emp['position'] ?? 'No position',
      department: emp['position'] ?? 'No department',
    );
  }

  Map toMap() {
    return {
      'createdAt': createdAt,
      'name': name,
      'avatar': avatar,
      'emailId': emailId,
      'mobile': mobile,
      'country': country,
      'state': state,
      'district': district,
      'id': id,
      'position': position,
      'department': department,
    };
  }
}
