import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/users.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class UserForm extends StatefulWidget {
  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String?, String?> _formData = {
    'title': null,
    'avatarUrl': null,
    'genero': null,
    'description': null,
    'faixaEtaria': null,
    'duration': null,
    'nota': null,
    'ano': null,
  };

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['title'] = user.title;
      _formData['avatarUrl'] = user.avatarUrl;
      _formData['description'] = user.description;
      _formData['genero'] = user.genero;
      _formData['ano'] = user.ano;
      _formData['faixaEtaria'] = user.faixaEtaria;
      _formData['nota'] = user.nota;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final User? user = ModalRoute.of(context)!.settings.arguments as User?;
    if (user != null) {
      _loadFormData(user!);
    }
  }

  // const UserForm({super.key/});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de Usuário"),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            final isValid = _form.currentState!.validate();
            if (isValid) {
              _form.currentState?.save();

              Provider.of<Users>(context, listen: false).put(
                User(
                  id: _formData['id'] ?? "",
                  title: _formData['title'] ?? "",
                  avatarUrl: _formData['avatarUrl'] ?? "",
                  genero: _formData['genero'] ?? "",
                  duration: _formData['duration'] ?? "",
                  description: _formData['description'] ?? "",
                  nota: _formData['nota'] ?? "",
                  faixaEtaria: _formData['faixaEtaria'] ?? "",
                  ano: _formData['ano'] ?? "",
                ),
              );
              Navigator.of(context).pop();
            }
          },
          child: Icon(Icons.save)),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(children: [
            TextFormField(
              initialValue: _formData['avatarUrl'],
              decoration: InputDecoration(labelText: "Url da Imagem"),
              onSaved: (value) => _formData['avatarUrl'] = value!,
            ),
            TextFormField(
              initialValue: _formData['title'],
              decoration: InputDecoration(labelText: "Título da Imagem"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Preencha o campo corretamente.";
                }
                if (value.trim().length <= 3) {
                  return "Necessário 3 ou mais caracteres";
                }
                return null;
              },
              onSaved: (value) => _formData['title'] = value!,
            ),
            TextFormField(
              initialValue: _formData['genero'],
              decoration: InputDecoration(labelText: "Gênero"),
              onSaved: (value) => _formData['genero'] = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Faixa etária"),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Duração"),
              onSaved: (value) => _formData['duration'] = value!,
            ),
            TextFormField(
              initialValue: _formData['nota'],
              decoration: InputDecoration(labelText: "Nota"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Preencha o campo corretamente.";
                }

                return null;
              },
              onSaved: (value) => _formData['nota'] = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Ano"),
              initialValue: _formData['ano'],
              onSaved: (value) => _formData['ano'] = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Descrição"),
              initialValue: _formData['description'],
              onSaved: (value) => _formData['description'] = value!,
            ),
          ]),
        ),
      ),
    );
  }
}
