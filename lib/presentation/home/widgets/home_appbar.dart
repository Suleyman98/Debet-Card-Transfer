import 'package:debet_card_transfer/app/app_colors.dart';
import 'package:debet_card_transfer/app/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? balance;
  const HomeAppBar({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const DrawerController(),
      backgroundColor: AppColors.black,
      title: Text('Welcome!', style: AppTextStyles.boldTextWhite),
      actions: [
        Text(
          balance == -1 ? 'No Debit Card Found' : 'Balance: $balance AZN',
          style: AppTextStyles.boldTextWhite,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(0, 70);
}

class DrawerController extends StatelessWidget {
  const DrawerController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(
            Icons.menu,
            color: AppColors.whiteColor,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: 'logout here',
        );
      },
    );
  }
}
