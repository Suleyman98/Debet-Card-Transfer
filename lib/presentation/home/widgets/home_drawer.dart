import 'package:debet_card_transfer/app/app_sized_box.dart';
import 'package:debet_card_transfer/app/app_text_styles.dart';
import 'package:debet_card_transfer/business_logic/cubits/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.exit_to_app),
            AppSizedBox.w10,
            InkWell(
                onTap: () {
                  context.read<HomeCubit>().logout(context);
                },
                child: Text(
                  'Logout',
                  style: AppTextStyles.boldTextBlack,
                )),
          ],
        )
      ],
    ));
  }
}
