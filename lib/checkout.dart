import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  TextEditingController amountController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Checkout Page')),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: amountController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter amount';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              prefix: Text('₦',
                                  style: TextStyle(color: Colors.black)),
                              hintText: '2000',
                              labelText: 'Amount',
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: 'janedoe@who.com',
                                labelText: 'Email',
                                border: OutlineInputBorder())),
                        const SizedBox(height: 50),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors
                                    .white, //change background color of button
                                backgroundColor:
                                    Colors.teal, //change text color of button
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                elevation: 5.0,
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text('Proceed to Pay',
                                      style: TextStyle(fontSize: 20))),
                            )),
                      ],
                    )))));
  }
}
