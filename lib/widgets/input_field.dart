import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool obscure;
  final Stream<String> stream;
  final Function(String) onChanged;

  InputField(
      {this.label, this.icon, this.obscure, this.stream, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          return TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              icon: Icon(icon, color: Colors.white),
              labelText: label,
              labelStyle: TextStyle(color: Colors.white),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pinkAccent),
              ),
              contentPadding: const EdgeInsets.all(20),
              /* 
                  verificar se existe erro e setá-lo com o stream snapshot
               */
              errorText: snapshot.hasError ? snapshot.error : null,
            ),
            style: TextStyle(
              color: Colors.white,
            ),
            obscureText: obscure,
          );
        });
  }
}
