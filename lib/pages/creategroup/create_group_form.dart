import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupkash/controllers/auth_controller.dart';
import 'package:groupkash/controllers/group_controller.dart';
import 'package:groupkash/models/group_model.dart';
import 'package:groupkash/pages/auth_area/dashboard_main.dart';
import 'package:groupkash/pages/creategroup/create_group_form_two.dart';
import 'package:groupkash/utils/custom_http_exception.dart';
import 'package:groupkash/widgets/appbtn.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../../widgets/custom_app_bar.dart';

class CreateGroupForm extends StatefulWidget {
  const CreateGroupForm({Key? key}) : super(key: key);

  @override
  State<CreateGroupForm> createState() => _CreateGroupFormState();
}

class _CreateGroupFormState extends State<CreateGroupForm> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _countryNode = FocusNode();
  final _currencyNode = FocusNode();
  final _descriptionNOde = FocusNode();

  String groupName = "";
  String groupDescription = "";
  String country = "";
  String currency = "";

  void _navigate(GroupData groupData) {
    Navigator.of(context).pushReplacementNamed(MainDashboardPage.routeName,
        arguments: groupData);
  }

  Future<void> _createGroup(String token) async {
    try {
      setState(() {
        isLoading = true;
      });
      if (!_formKey.currentState!.validate()) {
        return;
      }
      _formKey.currentState!.save();
      GroupData groupData = await Provider.of<Group>(context, listen: false)
          .createGroup(groupName, country, currency, groupDescription);
      setState(() {
        isLoading = false;
      });
      _navigate(groupData);
    } on CustomHttpException catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 2),
          content: Text(error.toString())));
    } on SocketException catch (_) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 2),
          content: Text("No Internet Connection")));
    } catch (error) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Internal Server Error")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController currencyController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    final token = Provider.of<Auth>(context).accessToken;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: CustomScrollView(slivers: [
            const SliverToBoxAdapter(
              child: CustomAppBar(
                title: "Create New Group",
                width: 60,
              ),
            ),
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Please enter group details.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 40, bottom: 15),
                child: TextFormField(
                  onSaved: ((newValue) {
                    groupName = newValue!;
                  }),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_countryNode);
                  },
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    labelText: 'Group name',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: 'Kash group',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextFormField(
                  onSaved: ((newValue) {
                    groupDescription = newValue!;
                  }),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_currencyNode);
                  },
                  textInputAction: TextInputAction.next,
                  controller: countryController,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    labelText: 'Country',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: 'Nigeria',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextFormField(
                  onSaved: ((newValue) {
                    currency = newValue!;
                  }),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionNOde);
                  },
                  textInputAction: TextInputAction.next,
                  controller: currencyController,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    labelText: 'Naira',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: 'Naira',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  onSaved: ((newValue) {
                    groupDescription = newValue!;
                  }),
                  maxLines: 4,
                  controller: descController,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: 'Description',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: 287,
                height: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: OutlinedButton(
                    onPressed: (() => _createGroup(token!)),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: mainColor,
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Create",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
