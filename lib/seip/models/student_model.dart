class StudentModel{
  String course;
  String name;
  String email;
  String phone;

  StudentModel(this.course, this.name, this.email, this.phone);

  @override
  String toString() {
    return 'StudentModel{course: $course, name: $name, email: $email, phone: $phone}';
  }
}