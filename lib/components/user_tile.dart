import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/users.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

// FAVOR TESTAR NO EMULADOR LINUX, O do android é muito pesado no LINUX.
class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? Container(
            color: Colors.grey,
            child: Icon(Icons.person, size: 300),
          )
        : Container(
            width: double.infinity,
            height: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(user.avatarUrl),
              ),
            ),
          );
    return Dismissible(
      key: Key(user.id),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      onDismissed: (direction) {
        Provider.of<Users>(context, listen: false).remove(user);
      },
      child: Card(
        elevation: 4,
        child: ListTile(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (_) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Alterar'),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.USER_FORM,
                          arguments: user,
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Exibir Dados'),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.USER_FORM,
                          arguments: user,
                        );
                      },
                    ),
                  ],
                );
              },
            );
          },
          leading: Container(
            width: 120,
            height: 80,
            child: avatar,
          ),
          title: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Duração: ${user.duration}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Gênero: ${user.genero}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nota: ${user.nota}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(user.description),
          ),
        ),
      ),
    );
  }
}
