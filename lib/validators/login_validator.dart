import 'dart:async';

class LoginValidators {
  //transforma stream em outro objeto
  final validadeEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      //verificar se email é valido ou não
      if (email.contains("@", 1) && email.contains(".com"))
        //caso seja, adicionar a saida do "tubo"
        sink.add(email);

      //caso nao, enviar email
      else
        sink.addError("Insira um email válido");
    },
  );

  //para a senha
  final validadePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length > 6)
        sink.add(password);
      else
        sink.addError(
            'Insira uma senha válida,deve conter ao menos 6 caracteres');
    },
  );
}
