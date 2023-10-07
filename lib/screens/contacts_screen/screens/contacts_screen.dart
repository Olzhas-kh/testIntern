import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_intern/const/colors.dart';
import 'package:test_intern/core/injection_container.dart';
import 'package:test_intern/logic/contacts/bloc/contacts_bloc.dart';
import 'package:test_intern/screens/contacts_screen/screens/contacts_inside_screen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ContactsBloc>()..add(ContactsGetEvents()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Contacts',
          ),
        ),
        body: BlocBuilder<ContactsBloc, ContactsState>(
          builder: (context, state) {
            if (state is ContactsInitial) {
              return const Center(
                child: Text(
                  "Initial State",
                ),
              );
            }
            if (state is ContactLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ContactSuccess) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.getContacts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ContactsInsideScreen(
                                name: state.getContacts[index].name,
                                email: state.getContacts[index].email,
                                userName: state.getContacts[index].username,
                                phoneNumber: state.getContacts[index].phone,
                                website: state.getContacts[index].website,
                                company: state.getContacts[index].company.name,
                                adresss:
                                    state.getContacts[index].address.street,
                                lat: state.getContacts[index].address.geo.lat,
                                lng: state.getContacts[index].address.geo.lng,
                              ))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: ListTile(
                          tileColor: ColorProject.background,
                          leading: Icon(
                            Icons.person,
                            color: ColorProject.white,
                          ),
                          title: Text(
                            state.getContacts[index].name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            if (state is ContactFailed) {
              return Center(
                child: Text(
                  state.errorMessage,
                ),
              );
            }
            return const Offstage();
          },
        ),
      ),
    );
  }
}
