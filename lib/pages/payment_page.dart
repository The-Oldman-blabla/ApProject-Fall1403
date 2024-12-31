import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final double totalAmount;

  const PaymentPage({Key? key, required this.totalAmount}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController cardNumberCtrl = TextEditingController();
  final TextEditingController pinCtrl = TextEditingController();
  String? validationError;

  void validateAndProcess() {
    final cardNum = cardNumberCtrl.text.trim();
    final pin = pinCtrl.text.trim();

    setState(() {
      if (cardNum.isEmpty || pin.isEmpty) {
        validationError = 'All fields are required.';
      } else if (pin != '1234') {
        validationError = 'Incorrect PIN. Please check and retry.';
      } else {
        validationError = null;
        _showSuccessDialog();
      }
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Payment Confirmed'),
        content: Text('Your payment of \$${widget.totalAmount.toStringAsFixed(2)} has been processed.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secure Payment'),
        backgroundColor: Colors.grey.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Payment Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            _buildInputField(
              controller: cardNumberCtrl,
              label: 'Card Number',
              isPassword: false,
            ),
            const SizedBox(height: 20),
            _buildInputField(
              controller: pinCtrl,
              label: 'PIN',
              isPassword: true,
            ),
            const SizedBox(height: 20),
            Text(
              'Total Amount: \$${widget.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber),
            ),
            if (validationError != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  validationError!,
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: validateAndProcess,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                backgroundColor: Colors.amber,
              ),
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade800,
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required bool isPassword,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade700,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      obscureText: isPassword,
      keyboardType: isPassword ? TextInputType.number : TextInputType.text,
    );
  }
}
