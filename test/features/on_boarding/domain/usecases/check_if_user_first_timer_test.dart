import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nexusdeep/features/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:nexusdeep/features/on_boarding/domain/usecases/check_if_user_first_timer.dart';

import 'package:test/test.dart';

import 'on_boarding_repo.mock_test.dart';

void main() {
  late OnBoardingRepo repo;
  late CheckIfUserFirstTimer usecase;

  setUp(() {
    repo = MockOnBoardingRepo();
    usecase = CheckIfUserFirstTimer(repo);
  });

  test(
      "should get response from [MockOnBoardingRepo]",
      () async {
        when(()=>repo.checkIfUserIsFirstTimer()).thenAnswer(
                (_) async => const Right(true)
        );
        final result = await usecase();
        expect(result, equals(Right<bool,dynamic>(true)));
        verify(()=>repo.checkIfUserIsFirstTimer()).called(1);
        verifyNoMoreInteractions(repo);
      }
  );
}
