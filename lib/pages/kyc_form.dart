import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:groupkash/pages/creategroup/create_group_form.dart';
import 'package:groupkash/controllers/auth_controller.dart';
import 'package:groupkash/widgets/appbtn.dart';
import 'package:groupkash/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class KycForm extends StatefulWidget {
  const KycForm({Key? key}) : super(key: key);

  @override
  State<KycForm> createState() => _KycFormState();
}

class _KycFormState extends State<KycForm> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _bvnController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final _bvnNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bvnNode.dispose();
  }

  String dob = "";
  String bvn = "";
  void _navigate() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const CreateGroupForm()));
  }

  void _selectDate(BuildContext context) async {
    DateFormat formatter = DateFormat("yyyy-MM-dd");

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1800),
        lastDate: DateTime.now());

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.value =
            TextEditingValue(text: formatter.format(picked));
      });
    }
  }

  void _kycVerification() async {
    setState(() {
      isLoading = true;
    });
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      _formKey.currentState!.save();
      await Provider.of<Auth>(context, listen: false)
          .verifyKyc(dob, int.parse(bvn));
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 100),
          content: Text("Verification Successfully")));
      _navigate();
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 100),
          content: Text("Error Occurred While Verifying")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: CustomAppBar(
                  title: "KYC Verification",
                  width: 70,
                ),
              ),
              const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'Please submit your details to continue.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 130,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextFormField(
                    controller: _dateController,
                    onTap: () => _selectDate(context),
                    onSaved: ((newValue) {
                      dob = newValue!;
                    }),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_bvnNode);
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'Date Of Birth',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: 'DD/MM/YYYY',
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
                    controller: _bvnController,
                    focusNode: _bvnNode,
                    onSaved: ((newValue) {
                      bvn = newValue!;
                    }),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'BVN number',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: '212545558754',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
                  child: AppButton(
                    callback: _kycVerification,
                    title: isLoading ? "Submitting..." : 'Submit',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
