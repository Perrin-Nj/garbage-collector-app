// ignore: file_names
import 'package:flutter/material.dart';
import 'package:garbage_collector_app/my_account.dart';
import 'package:garbage_collector_app/pickUp_assistance.dart';
import 'package:garbage_collector_app/pickUp_services/our_agencies.dart';
import 'package:garbage_collector_app/pickUp_services/pickUp_history.dart';
import 'package:garbage_collector_app/pickUp_services/pickUp_schedule.dart';
import 'package:garbage_collector_app/pickUp_services/pickUp_subscription.dart';
import 'package:garbage_collector_app/utils/Themes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150, //height of appBar
        backgroundColor: PRIMARY_COLOR,
        flexibleSpace: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 340,
                    ),
                    Icon(
                      Icons.share,
                      size: 40,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Salut John!!',
                    style: Theme.of(context).textTheme.bodyText1),
                const Text(
                  'Que pouvons nous faire pour vous?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
              ],
            ),
            Align(
              alignment: const Alignment(0, 4.2), //pos of circle
              child: Container(
                height: 130, //height of circle
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 4.0,
                    ),
                  ],
                  border: Border.all(
                    width: 2,
                    color: Colors.transparent,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 8,
                      color: PRIMARY_COLOR,
                    ),
                  ),
                  child: Image.asset("assets/images/logo.png",
                      height: 70, width: 70),
                ),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            //wrap in a safeArea
            //designing cards to add services
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossaxisAl,

            children: [
              const SizedBox(
                height: 80, //distance btw appBar and body
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
                          return const PickUpSchedule();
                        },
                      ),
                    ),
                    child: cardServices(
                      const Icon(
                        Icons.calendar_month_sharp, //work_history
                        size: 90,
                        color: Colors.cyan,
                      ),
                      'Programmer \n \t\t\t\t\t\t Un Ramassage',
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    splashColor: Theme.of(context).colorScheme.secondary,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (_) {
                          return const PickUpSubscription();
                        },
                      ),
                    ),
                    child: cardServices(
                      const Icon(
                        Icons.free_cancellation_outlined,
                        size: 90,
                        color: Color.fromARGB(255, 16, 156, 216),
                      ),
                      "Souscrire à\n \t\t\t\t\t\t Un Ramassage",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              //const Expanded(child: SizedBox.shrink()),
              Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    splashColor: Theme.of(context).colorScheme.secondary,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (_) {
                          return const PickUpHistory();
                        },
                      ),
                    ),
                    child: cardServices(
                      const Icon(
                        Icons.history_outlined,
                        size: 90,
                        color: Color.fromARGB(255, 114, 153, 158),
                      ),
                      "Historique \n\t\r\r\r\t\t\tDe ramassage",
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    splashColor: Theme.of(context).colorScheme.secondary,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (_) {
                          return const OurAgencies();
                        },
                      ),
                    ),
                    child: cardServices(
                      const Icon(
                        Icons.location_on_outlined,
                        size: 90,
                        color: Color.fromARGB(255, 31, 200, 230),
                      ),
                      "Nos agences \t\t\t A proximité",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              //bottom nav bar
              const Divider(
                thickness: 2,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(5),
                    splashColor: Theme.of(context).colorScheme.secondary,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (_) {
                          return const PickUpAssistance();
                        },
                      ),
                    ),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.contact_support_outlined,
                          color: PRIMARY_COLOR,
                          size: 35,
                        ),
                        Text(
                          'Assistance',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 220,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(5),
                    splashColor: Theme.of(context).colorScheme.secondary,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (_) {
                          return const Myaccount();
                        },
                      ),
                    ),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.person,
                          color: PRIMARY_COLOR,
                          size: 35,
                        ),
                        Text(
                          'Mon compte',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: const Alignment(0, 0.97),
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 9.0), //(x,y)
                    blurRadius: 9.0,
                  ),
                ],
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 6,
                  color: PRIMARY_COLOR,
                ),
              ),
              child:
                  Image.asset("assets/images/logo.png", height: 60, width: 60),
            ),
          ),
        ],
      ),
    );
  }

  Container cardServices(Icon img, var txt) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 23,
      ),
      height: 190,
      width: 150,
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
          Radius.circular(16),
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
                  fontSize: 17,
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
