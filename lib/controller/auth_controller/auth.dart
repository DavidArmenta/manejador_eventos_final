import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:manejador_eventos/models/user_model.dart";


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;
  

  Future createAccount(String email, String password, String username) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        _currentUser = UserModel(uid: user.uid, email: user.email ?? '', password: '', username: '');
        await _firebaseFirestore.collection('users').doc(user.uid).set({
          'email': user.email,
          'username': username,
        });
        return true;
      }
    } on FirebaseAuthException catch (e) {
       if (e.code == 'weak-password') {
        return "Contraseña muy debil";
      }else if(e.code == 'email-already-in-use'){
        return "Ese correo ya esta registrado";
      }else if(e.code == 'invalid-email'){
        return "Ingresa un correo Valido";
      }
      else {
        return "Hubo un error al registrar tu cuenta, intentelo denuevo";        
      }
    }
    return null;
  }


  Future signInEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        _currentUser = UserModel(uid: user.uid, email: user.email ?? '', password: '', username: '');
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return "Credenciales Invalidas";
      }else if (e.code == 'invalid-email') {
        return "Ingresa un Email valido";
      }
      else {
        return "Credenciales Invalidas";
      }
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _currentUser = null;
  }


   Future<UserModel?> getCurrentUser() async {
    final User? user = _auth.currentUser;
    if (user!= null) {
      final DocumentSnapshot<Map<String, dynamic>> userDoc = await _firebaseFirestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        return UserModel(
          uid: user.uid,
          email: user.email?? '',
          password: '',
          username: userDoc.data()?['username']?? '',
        );
      }
    }
    return null;
  }


}