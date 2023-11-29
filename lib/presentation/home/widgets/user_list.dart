import 'package:debet_card_transfer/services/models/user_model.dart';
import 'package:debet_card_transfer/presentation/home/widgets/single_user.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({
    super.key,
    required this.users,
  });

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          height: 3,
        );
      },
      itemCount: users.length,
      itemBuilder: (context, index) {
        UserModel user = users[index];
        return SingleUser(user: user);
      },
    );
  }
}
