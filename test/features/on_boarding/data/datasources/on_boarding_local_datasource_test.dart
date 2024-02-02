import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/features/on_boarding/data/datasources/on_boarding_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MockSharedPreferences extends Mock implements SharedPreferences{

}

void main() {
  late SharedPreferences prefs;
  late OnBoardingLocalDataSourceImpl localDataSourceImpl;

   setUp((){
    prefs = MockSharedPreferences();
    localDataSourceImpl = OnBoardingLocalDataSourceImpl(prefs);
   });

   group('cacheFirstTimer', (){
     test('should call [sharedPrefs]', () async{
       when(()=>prefs.setBool(any(),any())).thenAnswer((_)async => true);
       await localDataSourceImpl.cacheFirstTimer();
       verify(()=>prefs.setBool(kFirstTimerKey, false)).called(1);
       verifyNoMoreInteractions(prefs);
     });
     test('should throw [cached exception] when storage err occur', () async{
       when(()=>prefs.setBool(kFirstTimerKey, false)).thenThrow(Exception());
       final methodCall = localDataSourceImpl.cacheFirstTimer;
       expect(methodCall, throwsA(isA<CacheException>()));
       verify(()=>prefs.setBool(kFirstTimerKey, false)).called(1);
       verifyNoMoreInteractions(prefs);
     });
   });
   group('checkIfUserIsFirstTimer', (){
     test('should call [checkIfUserIsFirstTimer] and return with the correct data', ()async{
      when(()=>prefs.getBool(any())).thenReturn(false);
      final result = await localDataSourceImpl.checkIfUserIsFirstTimer();
      expect(result, false);
      verify(()=>prefs.getBool(kFirstTimerKey)).called(1);
      verifyNoMoreInteractions(prefs);
     });
     test('should return true if no data', ()async{
       when(()=>prefs.getBool(any())).thenReturn(true);
       final result = await localDataSourceImpl.checkIfUserIsFirstTimer();
       expect(result, true);
       verify(()=>prefs.getBool(kFirstTimerKey)).called(1);
       verifyNoMoreInteractions(prefs);
     });

     test('should throw [CachedException] when there is error', ()async{
       when(()=>prefs.getBool(any())).thenThrow(Exception());
       final methodCall = await localDataSourceImpl.checkIfUserIsFirstTimer;
       expect(methodCall, throwsA(isA<CacheException>()));
       verify(()=>prefs.getBool(kFirstTimerKey));
       verifyNoMoreInteractions(prefs);
     });
   });
}