
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexusdeep/core/common/app/providers/user_session.dart';
import 'package:nexusdeep/core/services/injection_container.dart';
import 'package:nexusdeep/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:nexusdeep/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nexusdeep/features/auth/presentation/views/forgot_password_screen.dart';
import 'package:nexusdeep/features/auth/presentation/views/signin_screen.dart';
import 'package:nexusdeep/features/auth/presentation/views/signup_screen.dart';
import 'package:nexusdeep/features/auth/presentation/views/signup_with_email_screen.dart';
import 'package:nexusdeep/features/auth/presentation/views/verify_email_screen.dart';
import 'package:nexusdeep/features/dashboard/presentation/views/dashboard.dart';
import 'package:nexusdeep/features/notification/notification_screen.dart';
import 'package:nexusdeep/features/on_boarding/data/datasources/on_boarding_local_datasource.dart';
import 'package:nexusdeep/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:nexusdeep/features/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:nexusdeep/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:nexusdeep/features/profile/presentation/view/account_setting.dart';
import 'package:nexusdeep/features/profile/presentation/view/appearance_setting.dart';
import 'package:nexusdeep/features/profile/presentation/view/create_profile_screen.dart';
import 'package:nexusdeep/features/profile/presentation/view/notification_setting.dart';
import 'package:nexusdeep/features/profile/presentation/view/scan_user_id_screen.dart';
import 'package:nexusdeep/features/profile/presentation/view/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'route.main.dart';
