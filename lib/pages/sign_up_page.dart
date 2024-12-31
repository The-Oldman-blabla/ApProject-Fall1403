import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmPassCtrl = TextEditingController();
  bool isPasswordVisible = false;
  String? validationMessage;

  bool validatePassword(String password) {
    final pattern = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$');
    return pattern.hasMatch(password);
  }

  void handleSignUp() {
    setState(() {
      final username = usernameCtrl.text.trim();
      final email = emailCtrl.text.trim();
      final password = passwordCtrl.text.trim();
      final confirmPassword = confirmPassCtrl.text.trim();

      if (username.isEmpty || email.isEmpty || password.isEmpty) {
        validationMessage = 'All fields are required.';
      } else if (password != confirmPassword) {
        validationMessage = 'Passwords do not match.';
      } else if (!validatePassword(password)) {
        validationMessage =
        'Password must be at least 8 characters and include a number, an uppercase letter, and a lowercase letter.';
      } else if (username == password) {
        validationMessage = 'Password should not match the username.';
      } else {
        validationMessage = null;
        Navigator.pushReplacementNamed(context, '/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: usernameCtrl,
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordCtrl,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !isPasswordVisible,
              ),
              SizedBox(height: 16),
              TextField(
                controller: confirmPassCtrl,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 24),
              if (validationMessage != null)
                Text(
                  validationMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: handleSignUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                ),
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[850],
    );
  }
}
