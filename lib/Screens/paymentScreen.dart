// import 'package:flutter/material.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(App());
// }

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: PayMent(),
//       ),
//     );
//   }
// }

// class PayMent extends StatefulWidget {
//   @override
//   _PayMentState createState() => _PayMentState();
// }

// class _PayMentState extends State<PayMent> {
//   TextEditingController _controller = TextEditingController();

//   Razorpay _razorpay;

//   void openCheckout() async {
//     var options = {
//       'key': 'rzp_test_gmpHrsl8Jqn4VS',
//       'amount': double.parse(_controller.text) * 100.roundToDouble(),
//       'name': 'amit kumar.',
//       'description': 'just a flutter project',
//       'prefill': {'contact': '', 'email': ''},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint(e);
//     }
//   }

//   @override
//   void initstate() {
//     _razorpay = Razorpay();
//     super.initState();

//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

//     @override
//     Widget build(BuildContext context) {
//       return Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               TextField(
//                 controller: _controller,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide: BorderSide(
//                           width: 5,
//                           color: Colors.deepOrange,
//                         ))),
//               ),
//               RaisedButton(
//                   onPressed: () {
//                     openCheckout();
//                   },
//                   child: Text('Pay Now'))
//             ],
//           ),
//         ),
//       );
//     }

//     void _handlePaymentSuccess(PaymentSuccessResponse response) {
//       Scaffold.of(context).showSnackBar(
//         SnackBar(
//           content: Text("SUCCESS: " + response.paymentId),
//         ),
//       );
//     }

//     void _handlePaymentError(PaymentFailureResponse response) {
//       Scaffold.of(context).showSnackBar(SnackBar(
//           content: Text("ERROR: " +
//               response.code.toString() +
//               " - " +
//               response.message)));
//     }

//     void _handleExternalWallet(ExternalWalletResponse response) {
//       Scaffold.of(context).showSnackBar(
//           SnackBar(content: Text("EXTERNAL_WALLET: " + response.walletName)));
//       Fluttertoast.showToast(
//         msg: "EXTERNAL_WALLET: " + response.walletName,
//       );
//     }
//   }
// }
