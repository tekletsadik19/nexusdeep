import 'package:get_it/get_it.dart';
import 'package:nexusdeep/features/on_boarding/data/datasources/on_boarding_local_datasource.dart';
import 'package:nexusdeep/features/on_boarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:nexusdeep/features/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:nexusdeep/features/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:nexusdeep/features/on_boarding/domain/usecases/check_if_user_first_timer.dart';
import 'package:nexusdeep/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'injection_container.main.dart';

