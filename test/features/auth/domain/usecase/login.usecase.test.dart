// import 'package:dartz/dartz.dart';
// import 'package:mockito/mockito.dart';
// import 'package:owl_hris/features/auth/data/models/login.model.dart';
// import 'package:owl_hris/features/auth/domain/repository/login.repository.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:owl_hris/features/auth/domain/usecases/login.usecase.dart';

// class MockUserAuthRepository extends Mock implements UserAuthRepository {}

// void main() {
//   late UserAuthUseCase useCase;
//   late MockUserAuthRepository mockUserAuthRepository;
//   setUp(() {
//     mockUserAuthRepository = MockUserAuthRepository();
//     useCase = UserAuthUseCase(mockUserAuthRepository);
//   });

//   const usr = 'patrick.owl';
//   const pw = '12345678';
//   final model = LoginModel();

//   test('should ', () async {
//     // arrange
//     when(mockUserAuthRepository.loginUser(userNm: usr, pwd: pw))
//         .thenAnswer((_) async => Right(model));
//     // act
//     final result = useCase.execute(userNm: usr, pwd: pw);
//     // assert
//     expect(result, Right(model));
//     verify(mockUserAuthRepository.loginUser(userNm: usr, pwd: pw));
//     verifyNoMoreInteractions(mockUserAuthRepository);
//   });
// }
