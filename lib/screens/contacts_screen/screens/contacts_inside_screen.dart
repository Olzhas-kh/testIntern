import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_intern/const/colors.dart';
import 'package:test_intern/screens/contacts_screen/widgets/text_field_contact.dart';

class ContactsInsideScreen extends StatefulWidget {
  final String name;
  final String email;
  final String userName;
  final String phoneNumber;
  final String website;
  final String company;
  final String adresss;
  final String lat;
  final String lng;
  const ContactsInsideScreen({super.key, required this.name, required this.email, required this.userName, required this.phoneNumber, required this.website, required this.company, required this.adresss, required this.lat, required this.lng});

  @override
  State<ContactsInsideScreen> createState() => _ContactsInsideScreenState();
}

class _ContactsInsideScreenState extends State<ContactsInsideScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          widget.userName,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 16, top: 40, bottom: 21),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 121, 121, 121)),
                  child: Icon(
                    Icons.person,
                    color: ColorProject.contactsAvatarColor,
                    size: 38,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.name,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(letterSpacing: 1, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.email,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: ColorProject.listTileColor,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
               TextFieldContact(
                labelText: "E-mail",
                textEditingController: widget.email,
              ),
              const SizedBox(
                height: 20,
              ),
               TextFieldContact(
                labelText: "Phone Number",
                textEditingController: widget.phoneNumber,
              ),
              const SizedBox(
                height: 20,
              ),
               TextFieldContact(
                labelText: "Website",
                textEditingController: widget.website,
              ),
              const SizedBox(
                height: 20,
              ),
               TextFieldContact(
                labelText: "Company",
                textEditingController: widget.company,
              ),
              const SizedBox(
                height: 20,
              ),
               TextFieldContact(
                labelText: "Adress",
                textEditingController: widget.adresss,
              ),
              const SizedBox(height: 20,),
              Container(
  height: 215, 
  width: double.infinity,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),

  child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(double.parse(widget.lat), double.parse(widget.lng)), // Initial map position
          zoom: 13.0, // Zoom level
        ),
        markers: {
          // Add markers (optional)
          Marker(
            markerId: const MarkerId('markerId'),
            position: LatLng(double.parse(widget.lat), double.parse(widget.lng)), // Marker position
            infoWindow: const InfoWindow(title: 'Marker Title'),
          ),
        },
  ),
),
      
            ],
          ),
        ),
      ),
    );
  }
}
