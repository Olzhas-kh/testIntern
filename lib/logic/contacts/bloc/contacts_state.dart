part of 'contacts_bloc.dart';

abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactLoading extends ContactsState {}

class ContactSuccess extends ContactsState {
  final List<ContactsModel> getContacts;

  ContactSuccess({required this.getContacts});
}

class ContactFailed extends ContactsState {
  final String errorMessage;

  ContactFailed({required this.errorMessage});
}