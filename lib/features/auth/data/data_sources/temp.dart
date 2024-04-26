


// @override
// Future<void> forgotPassword({required String email}) async {
//   try {
//     await _authClient.sendPasswordResetEmail(email: email);
//   } on FirebaseAuthException catch (e) {
//     throw ServerException(
//       message: e.message ?? 'Error Occurred',
//       statusCode: e.code,
//     );
//   } catch (e, s) {
//     debugPrintStack(stackTrace: s);
//     throw ServerException(
//       message: e.toString(),
//       statusCode: 505,
//     );
//   }
// }



// @override
// Future<void> signUp({
//   required String name,
//   required String email,
//   required String phoneNumber,
//   required String profilePic,
//   required String password,
//   required String invitationCode,
// }) async {
//   try {
//     final isEmployee =
//         await checkIfInvitationCanBeUsed(invitationKey: invitationCode);
//     if (!isEmployee) {
//       throw const ServerException(
//           message: 'Contact Admin For Invite code', statusCode: 505,);
//     }
//     final userCredential = await _authClient.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     await userCredential.user?.updateDisplayName(name);
//     final userPositionInfo =
//         await getInviteUserInfo(invitationKey: invitationCode);
//     await userCredential.user?.updatePhotoURL(kDefaultAvatar);
//     await _setUserData(_authClient.currentUser!, userPositionInfo, email);
//   } on FirebaseAuthException catch (e) {
//     throw ServerException(
//       message: e.message ?? 'Error Occurred',
//       statusCode: e.code,
//     );
//   } on ServerException {
//     rethrow;
//   } catch (e, s) {
//     debugPrintStack(stackTrace: s);
//     throw ServerException(
//       message: e.toString(),
//       statusCode: 505,
//     );
//   }
// }

// @override
// Future<void> updateUser({
//   required UpdateUserAction action,
//   required dynamic userData,
// }) async {
//   try {
//     switch (action) {
//       case UpdateUserAction.email:
//         await _authClient.currentUser?.updateEmail(userData as String);
//         await _updateUser({'email': userData});
//       case UpdateUserAction.displayName:
//         await _authClient.currentUser?.updateDisplayName(userData as String);
//         await _updateUser({'name': userData});
//       case UpdateUserAction.profilePic:
//         final ref = _dbClient
//             .ref()
//             .child('profile-pics/${_authClient.currentUser?.uid}');
//         final uploadTask = await ref.putFile(userData as File);
//         final downloadUrl = await uploadTask.ref.getDownloadURL();
//         await _authClient.currentUser?.updatePhotoURL(downloadUrl);
//
//         await _updateUser({'profilePic': downloadUrl});
//       //context.read<UserProvider>().updateUser(updatedUser);
//       case UpdateUserAction.password:
//         if (_authClient.currentUser?.email == null) {
//           throw const ServerException(
//             message: 'User does not exist',
//             statusCode: 'Insufficient Permission',
//           );
//         }
//         final newData = jsonDecode(userData as String) as DataMap;
//         await _authClient.currentUser?.reauthenticateWithCredential(
//           EmailAuthProvider.credential(
//             email: _authClient.currentUser!.email!,
//             password: newData['oldPassword'] as String,
//           ),
//         );
//         await _authClient.currentUser
//             ?.updatePassword(newData['newPassword'] as String);
//       case UpdateUserAction.bio:
//         await _updateUser({'bio': userData as String});
//     }
//   } on FirebaseException catch (e) {
//     throw ServerException(
//       message: e.message ?? 'Error Occurred',
//       statusCode: e.code,
//     );
//   } on ServerException {
//     rethrow;
//   } catch (e, s) {
//     debugPrintStack(stackTrace: s);
//     throw ServerException(
//       message: e.toString(),
//       statusCode: 505,
//     );
//   }
// }
//
// Future<DocumentSnapshot<DataMap>> _getUserData(String uid) async {
//   return _cloudStoreClient.collection('users').doc(uid).get();
// }
//
// Future<void> _setUserData(
//   User user,
//   Map<InviteUserInfo, String> inviteData,
//   String fallbackEmail,
// ) async {
//   await _cloudStoreClient.collection('users').doc(user.uid).set(
//         LocalUserModel(
//                 phoneNumber: user.phoneNumber ?? '',
//                 email: user.email ?? fallbackEmail,
//                 uid: user.uid,
//                 name: user.displayName ?? '',
//                 isOnline: false,
//                 position: inviteData.values.first,
//                 department: inviteData.values.last)
//             .toMap(),
//       );
// }
//
// Future<void> _updateUser(DataMap data) async {
//   await _cloudStoreClient
//       .collection('users')
//       .doc(_authClient.currentUser?.uid)
//       .update(data);
// }

// @override
// Future<void> logout() async {
//   await _authClient.signOut();
// }

// https://facebook.meedu.app/docs/6.x.x/example


// return _pageBuilder(
// const Dashboard(),
// state,
// );