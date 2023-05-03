import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Quote {
  late String affirmation;
  Set usersLiked = {};
  late DatabaseReference _id; //get from firestore

  Quote(this.affirmation);

  void likePost(User user) {
    if (this.usersLiked.contains(user.uid)) {
      this.usersLiked.remove(user.uid);
    } else {
      this.usersLiked.add(user.uid);
    }
  }

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {'body': this.usersLiked, 'usersLiked': this.usersLiked.toList()};
  }
}
