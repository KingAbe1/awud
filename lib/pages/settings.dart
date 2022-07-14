import 'dart:convert';
import 'dart:io';
import 'package:awud_app/class/language.dart';
import 'package:awud_app/localization/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:awud_app/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Map<String, dynamic>? paymentIntentData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment '),
      ),
      body: Container(
        margin: EdgeInsets.all(50),
        child: Column(
          children: [
            Center(
              child: InkWell(
                onTap: ()async{
                  await makePayment();
                },
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.green,
                  child: Center(
                    child: Text('Pay with stripe' , style: TextStyle(color: Colors.white , fontSize: 20),),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: InkWell(
                onTap: (){
                  exit(0);
                },
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.green,
                  child: Center(
                    // child: Text(translation(context).pi , style: TextStyle(color: Colors.white , fontSize: 20),),
                   child: Text('Logout' , style: TextStyle(color: Colors.white , fontSize: 20),),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

    GestureDetector(
    onTap: () => {
    showDialog(
    context: context,
    builder: (BuildContext context) {
    return AlertDialog(
    title: Text('languages'),
    content: Padding(
    padding: const EdgeInsets.all(8.0),
    child: DropdownButton<Language>(
    underline: const SizedBox(),
    icon: const Icon(
    Icons.language,
    color: Colors.white,
    ),
    onChanged: (Language? language) async {
    // if (language != null) {
    // Locale _locale = await setLocale(language.languageCode);
    // navBar.setLocale(context, _locale);
    // }
    },
    items: Language.languageList()
        .map<DropdownMenuItem<Language>>(
    (e) => DropdownMenuItem<Language>(
    value: e,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
    // Text(
    //   e.flag,
    //   style: const TextStyle(fontSize: 30),
    // ),
    Text(e.name)
    ],
    ),
    ),
    )
        .toList(),
    ),
    ),
    );
    })
    },
    child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    // children: [
    // Text('language', style: TextStyle(fontSize: 20, color: Colors.grey[600])),
    // Icon(Icons.arrow_forward_ios, color: Colors.grey),
    // ],
    ),
    ),
    )
          ],
        ),
      )
    );
  }

  Future<void> makePayment() async {
    try {

      paymentIntentData =
      await createPaymentIntent('20', 'USD'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntentData!['client_secret'],
              applePay: true,
              googlePay: true,
              testEnv: true,
              style: ThemeMode.dark,
              merchantCountryCode: 'US',
              merchantDisplayName: 'Biruk')).then((value){
      });


      ///now finally display payment sheeet

      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {

    try {
      await Stripe.instance.presentPaymentSheet();
      //     parameters: PresentPaymentSheetParameters(
      //       clientSecret: paymentIntentData!['client_secret'],
      //       confirmPayment: true,
      //     )).then((newValue){
      //
      //
      //   print('payment intent'+paymentIntentData!['id'].toString());
      //   print('payment intent'+paymentIntentData!['client_secret'].toString());
      //   print('payment intent'+paymentIntentData!['amount'].toString());
      //   print('payment intent'+paymentIntentData.toString());
      //   //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("paid successfully")));
      //
      //   paymentIntentData = null;
      //
      // }).onError((error, stackTrace){
      //   print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      // });


    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Text("Cancelled "),
          ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
            'Bearer sk_test_51L3gIJC995YiUADq7CHbpqyFs9yzZjO2ufFURdD38E9r9GSUqdCJ8JbYsOL4inFHbfDmaH4Xblroa9wYJ6eFS9V700xkCadYj5',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100 ;
    return a.toString();
  }

}