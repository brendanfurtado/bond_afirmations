import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref("affirmations/0");
  // Future<DatabaseEvent> event =  await ref.once();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: const Text('User Profile'),
                    ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      })
                    ],
                  ),
                ),
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: FutureBuilder(
                  future: ref.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: <Widget>[
                          getJsonFromFirebaseRestAPI(context),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  print("hello");
                                },
                                icon: Icon(Icons.share),
                              ),
                              IconButton(
                                onPressed: () {
                                  print('Liked');
                                },
                                icon: Icon(
                                  Icons.favorite_border,
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    }
                    if (snapshot.hasError) {
                      return Text("Error");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    return CircularProgressIndicator();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  getImageAsset('./assets/images/man_standing.png'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: getImageAsset('./assets/images/heart.png'),
                      ),
                    ],
                  ),
                  getImageAsset('./assets/images/woman_standing.png'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Agent, this is your mission today:',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            )
            // const SignOutButton(),
          ],
        ),
      ),
    );
  }

  Widget getImageAsset(String path) {
    return SizedBox(
      height: 300,
      width: 125,
      child: Image.asset(path),
    );
  }
}

// getJsonFromFirebaseRestAPI(BuildContext context) async {
//   DatabaseReference ref = FirebaseDatabase.instance.ref("affirmations/0");
//   DatabaseEvent event = await ref.once();

//   // print(event.snapshot.value);
//   String? t = event.snapshot.value.toString();

//   return Text(
//     t,
//     textAlign: TextAlign.center,
//   );
// }

Widget getJsonFromFirebaseRestAPI(BuildContext context) {
  DatabaseReference ref = FirebaseDatabase.instance.ref("affirmations/0");

  return FutureBuilder<DatabaseEvent>(
    future: ref.once(),
    builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
      if (snapshot.hasData) {
        String t = "";
        if (snapshot.data!.snapshot.value is Map<String, dynamic>) {
          t = (snapshot.data!.snapshot.value
              as Map<String, dynamic>)['affirmation'];
        }
        return Text(
          t,
          textAlign: TextAlign.center,
        );
      } else if (snapshot.hasError) {
        return Text("Error");
      } else {
        return CircularProgressIndicator();
      }
    },
  );
}

// class GetJsonData extends StatelessWidget {
//   final String affirmationText;

//   GetJsonData(this.affirmationText);

//   @override
//   Widget build(BuildContext context) {
//     DatabaseReference ref = FirebaseDatabase.instance.ref("affirmations/0");

//     // TODO: implement build
//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc
//       builder:
//       )
//   }