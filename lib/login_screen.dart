import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/home1.dart';

import 'bloc/login_bloc_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenCubit? _loginScreenCubit;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _loginScreenCubit?.dispose();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loginScreenCubit = BlocProvider.of<LoginScreenCubit>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Login Form'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            children: [Expanded(child: _middleView()), _bottomButton()],
          ),
        ),
      ),
    );
  }

  _middleView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 100,
        ),
        const Center(
          child: Text(
            'Login In',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.teal),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        StreamBuilder(
            stream: _loginScreenCubit?.userNameStream,
            builder: (context, snapshot) {
              return TextField(
                  onChanged: (text) {
                    _loginScreenCubit?.updateUserName(text);
                  },
                  decoration: const InputDecoration(
                    labelText: 'UserName',
                  ),
                  keyboardType: TextInputType.name);
            }),
        const SizedBox(
          height: 15,
        ),
        StreamBuilder(
            stream: _loginScreenCubit?.passwordStream,
            builder: (context, snapshot) {
              return TextField(
                  onChanged: (text) {
                    _loginScreenCubit?.updatePassword(text);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  keyboardType: TextInputType.text);
            }),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
            stream: _loginScreenCubit?.phonenoStream,
            builder: (context, snapshot) {
              return TextField(
                  onChanged: (text) {
                    _loginScreenCubit?.updatePhoneNumber(text);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                  keyboardType: TextInputType.number);
            }),
      ],
    );
  }

  _bottomButton() {
    return StreamBuilder(
      stream: _loginScreenCubit?.validateForm,
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: () {
            if (snapshot.hasData) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home1()));
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: snapshot.hasData ? Colors.teal : Colors.grey,
                borderRadius: BorderRadius.circular(30)),
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 27),
              ),
            ),
          ),
        );
      },
    );
  }
}
