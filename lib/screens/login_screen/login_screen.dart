import 'package:AdminRavelineStore/blocs/login_bloc.dart';
import 'package:AdminRavelineStore/widgets/input_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem Vindo Admin'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 50, 50, 49),
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Color.fromARGB(255, 50, 50, 49),
                  Color.fromARGB(255, 81, 81, 80),
                  Color.fromARGB(255, 97, 97, 93),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //home icon
                  Icon(Icons.store, color: Colors.pink[300], size: 200),

                  //login widget
                  InputField(
                    icon: Icons.person_outline,
                    label: 'Usuário',
                    obscure: false,
                    stream: _loginBloc.outEmail,
                    onChanged: _loginBloc.changeEmail,
                  ),

                  //senha widget

                  InputField(
                    icon: Icons.lock,
                    label: 'Senha',
                    obscure: true,
                    stream: _loginBloc.outPassword,
                    onChanged: _loginBloc.changePassword,
                  ),
                  SizedBox(height: 36),
                  //botao widget
                  StreamBuilder<bool>(
                      stream: _loginBloc.outSubmitValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          height: 56,
                          child: RaisedButton.icon(
                            elevation: 10,
                            disabledColor: Colors.pink.withAlpha(100),
                            splashColor: Colors.black,
                            onPressed: snapshot.hasData ? () {} : null,
                            icon: Icon(
                              Icons.assignment_ind,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Entrar',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.pink[300],
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
