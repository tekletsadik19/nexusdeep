import 'package:equatable/equatable.dart';
import 'package:nexusdeep/core/usecase/usecase.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/auth/domain/repos/auth_repos.dart';

class SignUp extends UsecaseWithParams<void,SignUpParams>{
  const SignUp(this._authRepo);
  final AuthenticationRepository _authRepo;

  @override
  ResultFuture<void> call(SignUpParams params) =>
      _authRepo.signUp(
          name: params.name,
          email: params.email,
          profilePic: params.profilePic,
          phoneNumber: params.phoneNumber,
          password: params.password,
      );
}

class SignUpParams extends Equatable{

  const SignUpParams({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.profilePic,
    required this.password,
  });

  const SignUpParams.empty():this(
    name:'',
    email:'',
    phoneNumber:'',
    password:'',
    profilePic: '',
  );

  final String name;
  final String email;
  final String profilePic;
  final String phoneNumber;
  final String password;


  @override
  List<Object?> get props => [phoneNumber,email,profilePic,password,name];
}
