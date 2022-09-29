import 'package:flutter/material.dart';
import 'package:garbage_collector_app/auth/login/login_house.dart';

import 'login/register_house.dart';

class AuthPageHouse extends StatefulWidget {
  const AuthPageHouse({Key? key}) : super(key: key);

  @override
  State<AuthPageHouse> createState() => _AuthPageHouseState();
}

class _AuthPageHouseState extends State<AuthPageHouse> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginHouse(onClickedSignUpHouse: toggle)
      : RegisterHouse(onClickedSignInHouse: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
