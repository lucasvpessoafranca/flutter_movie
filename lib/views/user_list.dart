import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/user_tile.dart';
import 'package:flutter_application_1/data/dummy.users.dart';
import 'package:flutter_application_1/provider/users.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmes"),
        actions: [
          IconButton(
              onPressed: () {
                createAlertDialog(context,
                    """ Lucas França:\n Patricia Nobre \n  Marcos Vinicius """);
              },
              icon: Icon(Icons.accessibility_new_sharp))
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: users.count,
          itemBuilder: (contexto, i) => UserTile(users.byIndex(i)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed(
          AppRoutes.USER_FORM,
        ),
      ),
    );
  }
}

createAlertDialog(context, mensagem) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            title: Text("Integrantes:"),
            content: Text(mensagem),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok"),
              )
            ]);
      });
}

createBottomModal(context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(onPressed: () {}, child: Text("Alterar")),
              TextButton(onPressed: () {}, child: Text("Deletar"))
            ],
          ),
        );
      });
}
