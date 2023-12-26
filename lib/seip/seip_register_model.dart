import 'dart:io';

class SeipRegistrationModel{
  String? course_name;
  String? full_name;
  String? phone;
  String? email_address_uniq;
  String? religion;
  String? gender;
  String? birthday;
  String? national_id;
  String? employment_status;
  String? current_institute;
  String? semester;
  String? marketplace_link;
  String? freelancer_monthly_income;
  String? type_of_business;
  String? businessman_monthly_income;
  String? entrepreneur_working_sector;
  String? entrepreneur_monthly_income;
  String? field_of_interest;
  String? field_of_interest_alternative;
  String? company_name;
  String? designation;
  String? job_holder_monthly_income;
  String? present_address;
  String? present_city;
  String? present_postal_code;
  String? present_division;
  String? present_per_district;
  String? present_sub_district;
  String? lavel_of_education;
  String? institute_name;
  String? subject;
  String? passing_year;
  String? photo;

  SeipRegistrationModel(
      {this.course_name,
        this.full_name,
        this.phone,
        this.email_address_uniq,
        this.religion,
        this.gender,
        this.birthday,
        this.national_id,
        this.employment_status,
        this.current_institute,
        this.semester,
        this.marketplace_link,
        this.freelancer_monthly_income,
        this.type_of_business,
        this.businessman_monthly_income,
        this.entrepreneur_working_sector,
        this.entrepreneur_monthly_income,
        this.field_of_interest,
        this.field_of_interest_alternative,
        this.company_name,
        this.designation,
        this.job_holder_monthly_income,
        this.present_address,
        this.present_city,
        this.present_postal_code,
        this.present_division,
        this.present_per_district,
        this.present_sub_district,
        this.lavel_of_education,
        this.institute_name,
        this.subject,
        this.passing_year,
        this.photo=''
      });



  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['course_name'] = course_name;
    map['full_name'] = full_name;
    map['phone'] = phone;
    map['email_address_uniq'] = email_address_uniq;
    map['religion'] = religion;
    map['gender'] = gender;
    map['birthday'] = birthday;
    map['national_id'] = national_id;
    map['employment_status'] = employment_status;
    map['current_institute'] = current_institute;
    map['semester'] = semester;
    map['marketplace_link'] = marketplace_link;
    map['freelancer_monthly_income'] = freelancer_monthly_income;
    map['entrepreneur_working_sector'] = entrepreneur_working_sector;
    map['entrepreneur_monthly_income'] = entrepreneur_monthly_income;
    map['field_of_interest'] = field_of_interest;
    map['field_of_interest_alternative'] = field_of_interest_alternative;
    map['company_name'] = company_name;
    map['designation'] = designation;
    map['job_holder_monthly_income'] = job_holder_monthly_income;
    map['present_address'] = present_address;
    map['present_city'] = present_city;
    map['present_postal_code'] = present_postal_code;
    map['present_division'] = present_division;
    map['present_per_district'] = present_per_district;
    map['present_sub_district'] = present_sub_district;
    map['lavel_of_education'] = lavel_of_education;
    map['passing_year'] = passing_year;
    map['institute_name'] = institute_name;
    map['subject'] = subject;
    map['photo'] = photo;
    return map;
  }

  @override
  String toString() {
    return 'SeipRegistrationModel{course_name: $course_name, full_name: $full_name, phone: $phone, email_address_uniq: $email_address_uniq, religion: $religion, gender: $gender, birthday: $birthday, national_id: $national_id, employment_status: $employment_status, current_institute: $current_institute, semester: $semester, marketplace_link: $marketplace_link, freelancer_monthly_income: $freelancer_monthly_income, type_of_business: $type_of_business, businessman_monthly_income: $businessman_monthly_income, entrepreneur_working_sector: $entrepreneur_working_sector, entrepreneur_monthly_income: $entrepreneur_monthly_income, field_of_interest: $field_of_interest, field_of_interest_alternative: $field_of_interest_alternative, company_name: $company_name, designation: $designation, job_holder_monthly_income: $job_holder_monthly_income, present_address: $present_address, present_city: $present_city, present_postal_code: $present_postal_code, present_division: $present_division, present_per_district: $present_per_district, present_sub_district: $present_sub_district, lavel_of_education: $lavel_of_education, institute_name: $institute_name, subject: $subject, passing_year: $passing_year, photo: $photo}';
  }
}