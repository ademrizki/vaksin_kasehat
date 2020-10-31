import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_kasehat/business_logic/providers/authentication/register_provider.dart';
import 'package:vaksin_kasehat/ui/helpers/space.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = 'RegisterScreen';

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<RegisterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _provider.formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            TextFormField(
              controller: _provider.idController,
              validator: (String value) =>
                  value.length < 8 ? 'Please, fill ID properly' : null,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            Space(height: 10),
            TextFormField(
              controller: _provider.nameController,
              validator: (String value) =>
                  value.length < 3 ? 'Please, fill name properly' : null,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            Space(height: 10),
            TextFormField(
              controller: _provider.addressController,
              validator: (String value) =>
                  value.length < 3 ? 'Please, fill address properly' : null,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            Space(height: 10),
            TextFormField(
              controller: _provider.birthPlaceController,
              validator: (String value) =>
                  value.length < 3 ? 'Please, fill birth place properly' : null,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            Space(height: 10),
            TextFormField(
              controller: _provider.sexTypeController,
              validator: (String value) =>
                  value.length < 3 ? 'Please, fill address properly' : null,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            Space(height: 10),
            TextFormField(
              controller: _provider.provinceController,
              validator: (String value) =>
                  value.length < 3 ? 'Please, fill address properly' : null,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
