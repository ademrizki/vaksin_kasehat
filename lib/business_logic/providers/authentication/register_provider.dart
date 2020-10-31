import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final maritalStatusController = TextEditingController();
  final nationalityController = TextEditingController();
  final birthPlaceController = TextEditingController();
  final professionController = TextEditingController();
  final provinceController = TextEditingController();
  final religionController = TextEditingController();
  final districtController = TextEditingController();
  final addressController = TextEditingController();
  final sexTypeController = TextEditingController();
  final villageController = TextEditingController();
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  final idController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  DateTime birthDate;
}
