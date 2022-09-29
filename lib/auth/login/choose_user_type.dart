import 'package:flutter/material.dart';
import 'package:garbage_collector_app/auth/auth_page_house.dart';
import 'package:garbage_collector_app/auth/login/login_collector.dart';
import 'package:garbage_collector_app/utils/Themes.dart';

import 'login_house.dart';

class ChooseUserType extends StatefulWidget {
  const ChooseUserType({Key? key}) : super(key: key);

  @override
  State<ChooseUserType> createState() => _ChooseUserTypeState();
}

class _ChooseUserTypeState extends State<ChooseUserType> {
  void toggle() => setState(() => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromRGBO(51, 182, 161, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 95,
                ),
                Icon(
                  Icons.arrow_circle_right,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Vous etes ?',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                InkWell(
                  // ignore: avoid_print
                  borderRadius: BorderRadius.circular(16),
                  splashColor: Theme.of(context).colorScheme.secondary,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (_) {
                        return const LoginCollector();
                      },
                    ),
                  ),
                  child: userTypeCard(
                      const Icon(
                        Icons.time_to_leave, //work_history
                        size: 90,
                        color: PRIMARY_COLOR,
                      ),
                      'Ramasseur',
                      context),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  splashColor: Theme.of(context).colorScheme.secondary,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (_) {
                        return const AuthPageHouse();
                      },
                    ),
                  ),
                  child: userTypeCard(
                      const Icon(
                        Icons.house,
                        size: 90,
                        color: PRIMARY_COLOR,
                      ),
                      "\t\t\t\tMaison",
                      context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container userTypeCard(Icon img, var txt, BuildContext ctx) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        MediaQuery.of(ctx).size.width * 0.06,
        MediaQuery.of(ctx).size.width * 0.09 -
            MediaQuery.of(ctx).size.width * 0.09,
        MediaQuery.of(ctx).size.width * 0.09,
        MediaQuery.of(ctx).size.width * 0.01,
      ),
      height: 190, //190
      width: MediaQuery.of(ctx).size.width * 0.35,
      decoration: BoxDecoration(
        //boxShadow: BoxShadow.,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 4.0,
          ),
        ],
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          width: 2,
          color: Colors.transparent,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            img,
            const SizedBox(height: 20),
            SizedBox(
              width: 100,
              child: Text(
                txt,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
