import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se7tey/features/auth/presentation/manager/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  // login

  login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginErrorState('الحساب غير موجود'));
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorState('كلمة السر خطا'));
      } else {
        emit(LoginErrorState('حدثت مشكله فالتسجيل حاول لاحقا'));
      }
    }
  }

  // register a patient

  registerPatient(String name, String email, String password) async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = credential.user!;
      await user.updateDisplayName(name);

      // store in firebase
      FirebaseFirestore.instance.collection('patients').doc(user.uid).set({
        'name': name,
        'email': email,
        'uid': user.uid,
        'type': 'patient',
        'image': '',
        'phone': '',
        'bio': '',
        'city': '',
      }, SetOptions(merge: true));

      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterErrorState('كلمة المرور ضعيفة'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorState('الحساب موجود بالفعل'));
      } else {
        emit(RegisterErrorState('حدث خطأ ما'));
      }
    } catch (e) {}
  }

  // register a doctor

  registerDoctor(String name, String email, String password) async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = credential.user!;
      await user.updateDisplayName(name);

      // store in firebase
      FirebaseFirestore.instance.collection('doctors').doc(user.uid).set({
        'name': name,
        'image': '',
        'specialization': '',
        'rating': 3,
        'email': user.email,
        'phone1': '',
        'phone2': '',
        'bio': '',
        'openHour': '',
        'closeHour': '',
        'address': '',
        'uid': user.uid,
      }, SetOptions(merge: true));

      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterErrorState('كلمة المرور ضعيفة'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorState('الحساب موجود بالفعل'));
      } else {
        emit(RegisterErrorState('حدث خطأ ما'));
      }
    }
  }

  // upload doctor

  updateDoctorData(
      {required String uid,
      required String specialization,
      required String image,
      required String phone1,
      String? phone2,
      required String bio,
      required String startTime,
      required String endTime,
      required String address}) async {
    emit(UpdateLoadingState());
    try {
      FirebaseFirestore.instance.collection('doctors').doc(uid).set({
        'image': image,
        'specialization': specialization,
        'phone1': phone1,
        'phone2': phone2,
        'bio': bio,
        'openHour': startTime,
        'closeHour': endTime,
        'address': address,
      }, SetOptions(merge: true));
      emit(UpdateSuccessState());
    } catch (e) {
      emit(UpdateErrorState(e.toString()));
    }
  }
}
