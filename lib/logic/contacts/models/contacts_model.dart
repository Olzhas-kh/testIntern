import 'package:json_annotation/json_annotation.dart';
part 'contacts_model.g.dart';
@JsonSerializable()
class ContactsModel {
    int id;
    String name;
    String username;
    String email;
    AddressModel address;
    String phone;
    String website;
    CompanyModel company;

    ContactsModel({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.address,
        required this.phone,
        required this.website,
        required this.company,
    });

     factory ContactsModel.fromJson(Map<String ,dynamic> json )=>_$ContactsModelFromJson(json);
  Map<String, dynamic> toJson()=> _$ContactsModelToJson(this); 
}

@JsonSerializable()
class AddressModel {
    String street;
    String suite;
    String city;
    String zipcode;
    GeoModel geo;

    AddressModel({
        required this.street,
        required this.suite,
        required this.city,
        required this.zipcode,
        required this.geo,
    });

     factory AddressModel.fromJson(Map<String ,dynamic> json )=>_$AddressModelFromJson(json);
  Map<String, dynamic> toJson()=> _$AddressModelToJson(this); 
}
@JsonSerializable()
class GeoModel {
    String lat;
    String lng;

    GeoModel({
        required this.lat,
        required this.lng,
    });

     factory GeoModel.fromJson(Map<String ,dynamic> json )=>_$GeoModelFromJson(json);
  Map<String, dynamic> toJson()=> _$GeoModelToJson(this); 
}

@JsonSerializable()
class CompanyModel {
    String name;
    String catchPhrase;
    String bs;

    CompanyModel({
        required this.name,
        required this.catchPhrase,
        required this.bs,
    });

    factory CompanyModel.fromJson(Map<String ,dynamic> json )=>_$CompanyModelFromJson(json);
  Map<String, dynamic> toJson()=> _$CompanyModelToJson(this); 
}
