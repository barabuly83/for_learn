import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../widgets/user_list_widget.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: const UserListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserBloc>().add(const GetUsersEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}