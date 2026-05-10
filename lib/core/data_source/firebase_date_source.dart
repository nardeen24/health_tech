import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_tech/features/auth/models/user_model.dart';

class FirebaseDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //login
 Future<UserModel> login(String email, String password) async {
  UserCredential credential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );

  String uid = credential.user!.uid;

  DocumentSnapshot doc = await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .get();

  Map<String, dynamic> data =
      doc.data() as Map<String, dynamic>;

  return UserModel(
    email: data['email'],
    password: data['password'],
    name: data['name'],
    fav: data['fav'],
  );
}

  //signup
  Future<void> signUp(String email, String password, String name) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(
            UserModel(
              email: email,
              password: password,
              name: name,
              fav: [],
            ).toMap(),
          );
    } catch (e) {
      print(e);
    }
  }
}
