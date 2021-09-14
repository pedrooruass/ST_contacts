class ContactModel {
  String coordinates;
  String email;
  String image;
  String name;
  String tel;

  ContactModel({
    this.coordinates,
    this.email,
    this.image,
    this.name,
    this.tel,
  });

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      coordinates: map["coordinates"],
      email: map["email"],
      image: map["image"],
      name: map["name"],
      tel: map["tel"],
    );
  }
}
