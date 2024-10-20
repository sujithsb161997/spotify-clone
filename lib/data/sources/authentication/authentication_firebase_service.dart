import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/authentication/create_user_request.dart';
import 'package:spotify_clone/data/models/authentication/signin_user_request.dart';

abstract class AuthenticationFirebaseService {
  Future<Either> signup(CreateUserRequest createUserRequest);
  Future<Either> signin(SignInUserRequest signInUserRequest);
}

class AuthenticationFirebaseServiceImpl extends AuthenticationFirebaseService {
  @override
  Future<Either> signin(SignInUserRequest signInUserRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signInUserRequest.email, password: signInUserRequest.password);
      return const Right('SignIn was Successful');    
    } on FirebaseAuthException catch (e) {
String message = 'Something Went Wrong!';
      
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        message = 'Wrong username or Password';
      }

      return Left(message);
    }
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
