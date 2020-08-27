import 'package:AdminRavelineStore/validators/login_validator.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

/* 
  with LoginValidators, tras os dados de validação da classe criada e os repassa nos controllers
 */
class LoginBloc extends BlocBase with LoginValidators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

//declarar stream (saida de dados)  //transformar saida para validação de dados
  Stream<String> get outEmail =>
      _emailController.stream.transform(validadeEmail);
  Stream<String> get outPassword =>
      _passwordController.stream.transform(validadePassword);

//verificar se botao foi clicado
  Stream<bool> get outSubmitValid =>
      Observable.combineLatest2(outEmail, outPassword, (a, b) => true);

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    super.dispose();
  }
}
