import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/presentation/login/login_presenter.dart';
import 'package:movies_app/ui/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:movies_app/ui/utils/strings/string_resource.dart';
import 'package:movies_app/ui/widgets/rounded_button.dart';

class MockLoginPresenter extends Mock implements LoginPresenter {
  RxBool showEmailInvalid = false.obs;
  RxBool showPasswordInvalid = false.obs;
  RxBool loginButtonIsEnabled = false.obs;
  RxBool showLoginFailed = false.obs;

  void emitEmailError() => showEmailInvalid.value = true;
  void emitEmailValid() => showEmailInvalid.value = false;
  void emitPasswordError() => showPasswordInvalid.value = true;
  void emitPasswordValid() => showPasswordInvalid.value = false;
  void emitLoginButtonValid() => loginButtonIsEnabled.value = true;
  void emitLoginButtonInvalid() => loginButtonIsEnabled.value = false;
  void emitLoginFailed() => showLoginFailed.value = true;
}

void main() {
  late MockLoginPresenter presenter;

  Future<void> loadPage(WidgetTester tester) async {
    presenter = MockLoginPresenter();
    await tester.pumpWidget(MaterialApp(home: LoginScreen(presenter: presenter)));
  }

  testWidgets('Should call onChange with correct values', (WidgetTester tester) async {
    await loadPage(tester);

    final email = faker.internet.email();
    await tester.enterText(find.bySemanticsLabel(R.string.loginEmail), email);
    verify(() => presenter.onEmailChanged(email));

    final password = faker.internet.password();
    await tester.enterText(find.bySemanticsLabel(R.string.loginPassword), password);
    verify(() => presenter.onPasswordChanged(password));
  });

  testWidgets('Should present error if email is invalid', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitEmailError();
    await tester.pump();

    expect(find.text(R.string.loginEmailError), findsOneWidget);
  });

  testWidgets('Should present no error if email is valid', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitEmailError();
    await tester.pump();

    presenter.emitEmailValid();
    await tester.pump();

    expect(find.text(R.string.loginEmailError), findsNothing);
  });

  testWidgets('Should present error if password has less than 6 chars', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitPasswordError();
    await tester.pump();

    expect(find.text(R.string.loginPasswordError), findsOneWidget);
  });

  testWidgets('Should present no error if password is valid', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitPasswordError();
    await tester.pump();

    presenter.emitPasswordValid();
    await tester.pump();

    expect(find.text(R.string.loginPasswordError), findsNothing);
  });

  testWidgets('Should enable button if email and password are valid', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitLoginButtonValid();
    await tester.pump();

    final button = tester.widget<RoundedButton>(find.byKey(const Key('login_button')));
    expect(button.onPressed, isNotNull);
  });

  testWidgets('Should disable button if email or password arent valid', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitLoginButtonInvalid();
    await tester.pump();

    final button = tester.widget<RoundedButton>(find.byKey(const Key('login_button')));
    expect(button.onPressed, null);
  });

  testWidgets('Should call loginWithEmail on button pressed', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitLoginButtonValid();
    await tester.pump();
    final button = find.byKey(const Key('login_button'));
    await tester.ensureVisible(button);
    await tester.tap(button);
    await tester.pump();

    verify(() => presenter.onLoginWithEmail()).called(1);
  });

  testWidgets('Should call loginWithGoogle on button pressed', (WidgetTester tester) async {
    await loadPage(tester);

    final button = find.byKey(const Key('google_button'));
    await tester.ensureVisible(button);
    await tester.tap(button);
    await tester.pump();

    verify(() => presenter.onLoginWithGooglePressed()).called(1);
  });

}