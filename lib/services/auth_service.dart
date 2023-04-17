import 'package:travel_pesawat/models/user_model.dart';
import 'package:travel_pesawat/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // instance that is being used to interact with the Firebase Authentication service.
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // signInWithEmailAndPassword method from the FirebaseAuth instance to sign in the user and returns authenticated user and additional information like additional user data or ID token
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // retrieve the user details by passing the userCredential.user!.uid, the uid of the user that was returned from the firebase authentication
      UserModel user =
          await UserService().getUserById(userCredential.user!.uid);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> signUp(
      {required String email,
      required String password,
      required String name,
      String hobby = ''}) async {
    try {
      // createUserWithEmailAndPassword method from the FirebaseAuth instance to create a new user account and return authenticated user and additional information like additional user data or ID token.
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
          id: userCredential.user!.uid,
          email: email,
          name: name,
          hobby: hobby,
          balance: 280000000);

      // store the user details in the Firestore collection by passing the user object. This method will extract the fields of the user and add them to the Firestore document.
      await UserService().setUser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      // returns a future that completes with no value
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
