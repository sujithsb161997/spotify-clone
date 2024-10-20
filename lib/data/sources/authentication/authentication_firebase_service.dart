import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/authentication/create_user_request.dart';

abstract class AuthenticationFirebaseService {
  Future<Either> signup(CreateUserRequest createUserRequest);
  Future<void> signin();
}

class AuthenticationFirebaseServiceImpl extends AuthenticationFirebaseService {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserRequest.email, password: createUserRequest.password);
      return Right('Signup was Successful');    
    } on FirebaseAuthException catch (e) {
      print(e.message);
      String message = '';
      if(e.code == 'weak-password'){
        message = 'The password provided is too weak';
      }else if (e.code == 'email-already-in-use'){
        message == 'An account already exits with that email';
      }
      return Left(message);
    }
  }
}
