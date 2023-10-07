
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_intern/logic/contacts/models/contacts_model.dart';
import 'package:test_intern/logic/contacts/repositories/contacts_repository.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
      final ContactsRepository contactsRepository;

  ContactsBloc(this.contactsRepository) : super(ContactsInitial()) {
    on<ContactsGetEvents>((event, emit)async {
       emit(ContactLoading());
      try {
        final List<ContactsModel> response = await contactsRepository.getContacts();
        emit(ContactSuccess(getContacts: response));
      }catch (e) {
        emit(ContactFailed(errorMessage: e.toString()));
      }
    });
  }
}
