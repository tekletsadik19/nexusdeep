
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexusdeep/core/services/injection_container.dart';
import 'package:nexusdeep/features/auth/presentation/views/signup_screen.dart';
import 'package:nexusdeep/features/on_boarding/data/datasources/on_boarding_local_datasource.dart';
import 'package:nexusdeep/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:nexusdeep/features/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'route.main.dart';
