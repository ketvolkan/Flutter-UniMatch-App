import 'package:unimatch/Entities/UserPhoto.dart';

class User {
  final int? id;
  final List<UserPhoto>? photos;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? gender;
  final String? mail;
  final String? dateOfBirth;
  final String? description;
  final bool? verifiedAccount;
  final bool? active;

  User(
      {this.id,
      this.photos,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.gender,
      this.mail,
      this.dateOfBirth,
      this.description,
      this.active,
      this.verifiedAccount});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      mail: json['mail'],
      dateOfBirth: json['dateOfBirth'],
      description: json['description'],
      verifiedAccount: json['verifiedAccount'],
      active: json['active'],
    );
  }
}

final List<User> demoProfiles = [
  new User(
      id: 2,
      photos: [
        UserPhoto(
            id: 1, photoUrl: "assets/photo_1.jpg", active: true, userId: 2),
        UserPhoto(
            id: 2, photoUrl: "assets/photo_2.jpg", active: true, userId: 2),
        UserPhoto(
            id: 3, photoUrl: "assets/photo_3.jpg", active: true, userId: 2),
        UserPhoto(
            id: 4, photoUrl: "assets/photo_4.jpg", active: true, userId: 2),
      ],
      firstName: "Volkan",
      lastName: "Ket",
      phoneNumber: "05443332211",
      gender: "E",
      mail: "ketvolkan1@gmail.com",
      dateOfBirth: "2021-11-02",
      description: "Bursa",
      active: true,
      verifiedAccount: true),
  new User(
      id: 3,
      photos: [
        UserPhoto(
            id: 1, photoUrl: "assets/photo_3.jpg", active: true, userId: 3),
        UserPhoto(
            id: 2, photoUrl: "assets/photo_2.jpg", active: true, userId: 3),
        UserPhoto(
            id: 3, photoUrl: "assets/photo_1.jpg", active: true, userId: 3),
        UserPhoto(
            id: 4, photoUrl: "assets/photo_4.jpg", active: true, userId: 3),
      ],
      firstName: "Mehmet ",
      lastName: "Basat",
      phoneNumber: "05443332211",
      gender: "E",
      mail: "ketvolkan1@gmail.com",
      dateOfBirth: "2021-11-02",
      description: "Ankara",
      active: true,
      verifiedAccount: true),
  new User(
      id: 4,
      photos: [
        UserPhoto(
            id: 1, photoUrl: "assets/photo_2.jpg", active: true, userId: 4),
        UserPhoto(
            id: 2, photoUrl: "assets/photo_1.jpg", active: true, userId: 4),
        UserPhoto(
            id: 3, photoUrl: "assets/photo_3.jpg", active: true, userId: 4),
        UserPhoto(
            id: 4, photoUrl: "assets/photo_4.jpg", active: true, userId: 4),
      ],
      firstName: "Hanifi Can ",
      lastName: "Seven",
      phoneNumber: "05443332211",
      gender: "E",
      mail: "ketvolkan1@gmail.com",
      dateOfBirth: "2021-11-02",
      description: "KahramanMaraş",
      active: true,
      verifiedAccount: true),
  new User(
      id: 5,
      photos: [
        UserPhoto(
            id: 1, photoUrl: "assets/photo_4.jpg", active: true, userId: 5),
        UserPhoto(
            id: 2, photoUrl: "assets/photo_1.jpg", active: true, userId: 5),
        UserPhoto(
            id: 3, photoUrl: "assets/photo_3.jpg", active: true, userId: 5),
        UserPhoto(
            id: 4, photoUrl: "assets/photo_2.jpg", active: true, userId: 5),
      ],
      firstName: "Nazmi",
      lastName: "Becerik",
      phoneNumber: "05443332211",
      gender: "E",
      mail: "ketvolkan1@gmail.com",
      dateOfBirth: "2021-11-02",
      description: "Nazilli",
      active: true,
      verifiedAccount: true),
  new User(
      id: 6,
      photos: [
        UserPhoto(
            id: 1, photoUrl: "assets/photo_2.jpg", active: true, userId: 6),
        UserPhoto(
            id: 2, photoUrl: "assets/photo_1.jpg", active: true, userId: 6),
        UserPhoto(
            id: 3, photoUrl: "assets/photo_3.jpg", active: true, userId: 6),
        UserPhoto(
            id: 4, photoUrl: "assets/photo_4.jpg", active: true, userId: 6),
      ],
      firstName: "Sude",
      lastName: "Taşoyan",
      phoneNumber: "05443332211",
      gender: "K",
      mail: "ketvolkan1@gmail.com",
      dateOfBirth: "2021-11-02",
      description: "Bursa",
      active: true,
      verifiedAccount: true),
  new User(
      id: 7,
      photos: [
        UserPhoto(
            id: 1, photoUrl: "assets/photo_2.jpg", active: true, userId: 7),
        UserPhoto(
            id: 2, photoUrl: "assets/photo_1.jpg", active: true, userId: 7),
        UserPhoto(
            id: 3, photoUrl: "assets/photo_3.jpg", active: true, userId: 7),
        UserPhoto(
            id: 4, photoUrl: "assets/photo_4.jpg", active: true, userId: 7),
      ],
      firstName: "Baki Baran ",
      lastName: "Özel",
      phoneNumber: "05443332211",
      gender: "E",
      mail: "ketvolkan1@gmail.com",
      dateOfBirth: "2021-11-02",
      description: "Eskişehir",
      active: true,
      verifiedAccount: true),
];
