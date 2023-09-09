class UserInformation {
  final String sex;
  final int height;
  final int weight;
  final int age;
  UserInformation(
      {required this.sex,
      required this.height,
      required this.weight,
      required this.age});
}

class UserBMI {
  final String status;
  final double bmi;
  UserBMI({required this.status, required this.bmi});
}
