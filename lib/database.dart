import 'package:firebase_database/firebase_database.dart';
import 'components/quote.dart';

final databaseReference = FirebaseDatabase.instance.ref();

//Save 'like' of a quote to the database

// DatabaseReference saveLike(Quote quote) {
//   var id = databaseReference.child('quote/').push();
// }
