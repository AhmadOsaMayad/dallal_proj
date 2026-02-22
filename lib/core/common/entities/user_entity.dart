class UserEntity {
  const UserEntity({
    this.userId,
    this.img, //= Assets Data.rUserAvatar,
    this.fName = "Unknown",
    // required this.mName,
    // required this.lName,
    this.phoneNum,
    this.whatsNum,
    //this.email,
    // this.city,
  });
  final String? userId; //, city;
  final String? img;
  final String? fName; //, mName, lName;
  final String? phoneNum;
  final String? whatsNum; //, email; //optional
}
