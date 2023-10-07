import 'package:dio/dio.dart';
import 'package:test_intern/logic/contacts/datasources/contacts_datasource.dart';
import 'package:test_intern/logic/contacts/models/contacts_model.dart';

abstract class ContactsRepository{
  Future<List<ContactsModel>> getContacts();

}

class ContactsRepositoryImpl implements ContactsRepository{
  final ContactsDataSource contactsDataSource;

  ContactsRepositoryImpl(this.contactsDataSource);

  @override
  Future<List<ContactsModel>> getContacts() async{
    Response response = await contactsDataSource.getContact();
    return (response.data as List).map((i) => ContactsModel.fromJson(i)).toList();

  }
}