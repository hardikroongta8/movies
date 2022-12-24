import 'package:flutter/material.dart';
import 'package:movies/services/auth_service.dart';
import 'package:movies/shared/constants.dart';
import 'package:movies/shared/loading.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  const Login({required this.toggleView, super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  final _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
      backgroundColor: Colors.pink[800],
      appBar: AppBar(
        elevation: 0,
        title: const Text('Login'),
        backgroundColor: Colors.pink[900],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal:20),
        color: Colors.black87,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) => value == '' ? 'Field cannot be empty' : null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                cursorHeight: 24,
                cursorWidth: 0.6,
                cursorColor: Colors.black,
                keyboardType: TextInputType.emailAddress,
                decoration: textInputDecoration.copyWith(
                  hintText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  )
                )              
              ),
              const SizedBox(height: 30,),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                cursorHeight: 24,
                cursorWidth: 0.6,
                cursorColor: Colors.black,
                decoration: textInputDecoration.copyWith(
                  hintText: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  )
                )
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.pink[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
                onPressed: ()async{
                  setState(() {
                    loading = true;
                  });
                  if(_formKey.currentState!.validate()){
                    dynamic result = await _authService.login(email, password);
                    if(result == null){
                      setState(() {
                        setState(() {
                          loading = false;
                        });
                        error = 'Incorrect Email or Password!';
                      });
                    }
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.w300, 
                    color: Colors.white70
                  ),
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Don\'t have an account?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                  TextButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(const Size(0, 0))
                    ),
                    onPressed: (){
                      widget.toggleView();
                    },
                    child: Text('Sign-up', style: TextStyle(color: Colors.pink[800]),)
                  )
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}