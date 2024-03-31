import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.phoneNumber,
    required this.email,
    required this.uid,
    required this.username,
    this.profilePic,
  });

  const LocalUser.empty()
      : this(
    uid: '',
    username: '',
    phoneNumber: '',
    email: '',
    profilePic: '',
  );

  final String uid;
  final String username;
  final String email;
  final String? phoneNumber;
  final String? profilePic;


  @override
  String toString() {
    return 'LocalUser{uid: $uid, phoneNumber: $phoneNumber, '
        'email: $email}';
  }

  @override
  List<Object?> get props => [uid, username, email];

}
