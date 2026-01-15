import 'package:flutter/material.dart';
import '../models/user.dart';
import '../viewmodels/users_viewmodel.dart';
import '../constants/app_strings.dart';

class UsersPage extends StatefulWidget {
  final UsersViewModel viewModel;

  const UsersPage({super.key, UsersViewModel? viewModel})
    : viewModel = viewModel ?? const UsersViewModel();
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late Future<List<User>> _futureUsers;

  @override
  void initState() {
    super.initState();
    _futureUsers = widget.viewModel.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.usersPageTitle)),
      body: FutureBuilder<List<User>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${AppStrings.failedToLoadUsers}: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        user.name[0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(user.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${AppStrings.emailLabel}${user.email}'),
                        Text('${AppStrings.phoneLabel}${user.phone}'),
                        Text('${AppStrings.cityLabel}${user.address.city}'),
                        Text('${AppStrings.companyLabel}${user.company.name}'),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${AppStrings.selectedUser}${user.name}',
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text(AppStrings.noUsersFound));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _futureUsers = widget.viewModel.getUsers();
          });
        },
        tooltip: AppStrings.refreshTooltip,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
