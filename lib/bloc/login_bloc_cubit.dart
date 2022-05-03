import 'dart:async';
import 'package:bloc/bloc.dart';
  import 'package:rxdart/rxdart.dart';
  part 'login_bloc_state.dart';

  class LoginScreenCubit extends Cubit<LoginBloc> {
  LoginScreenCubit() : super(LoginInitial());

  //define controllers
  final _userNameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _phonenoController = BehaviorSubject<String>();



  //get data
  Stream<String> get userNameStream => _userNameController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get phonenoStream  => _phonenoController.stream;

  //clear the data
  void dispose() {
    updateUserName('');
    updatePassword('');
    updatePhoneNumber('');
  }

  //validation of UserName
  void updateUserName(String userName) {
    if (userName.length < 3) {
      _userNameController.sink.addError("Please enter at least 3 words");
    } else {
      _userNameController.sink.add(userName);
    }
  }

  //validation of Password
  void updatePassword(String password) {
    if (password.length < 4) {
      _passwordController.sink.addError("Please enter more then 4 words");
    } else {
      _passwordController.sink.add(password);
    }
  }

  //validation of PhoneNumber
  void updatePhoneNumber(String phoneNo) {
    if (phoneNo.length == 10) {
      _phonenoController.sink.add(phoneNo);
    } else {
      _phonenoController.sink.addError("Please enter valid Phone Number");

    }
  }

  //check validation
  Stream<bool> get validateForm => Rx.combineLatest3(
    userNameStream,
    passwordStream,
    phonenoStream,
        (a, b, c) => true,
  );
}