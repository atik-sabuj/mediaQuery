class Errors {
  late List<String> emailAddressUniq;
  late List<String> phone;
  late List<String> nationalId;
  late List<String> birthday;

  Errors({
    required this.emailAddressUniq,
    required this.phone,
    required this.nationalId,
    required this.birthday});

  Errors.fromJson(dynamic json) {
    emailAddressUniq = json['email_address_uniq'] != null ? json['email_address_uniq'].cast<String>() : [];
    phone = json['phone'] != null ? json['phone'].cast<String>() : [];
    nationalId = json['national_id'] != null ? json['national_id'].cast<String>() : [];
    birthday = json['birthday'] != null ? json['birthday'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email_address_uniq'] = emailAddressUniq;
    map['phone'] = phone;
    map['national_id'] = nationalId;
    map['birthday'] = birthday;
    return map;
  }

  @override
  String toString() {
    return 'Errors{emailAddress: $emailAddressUniq, phone: $phone, nationalId: $nationalId ,birthday: $birthday}';
  }
}