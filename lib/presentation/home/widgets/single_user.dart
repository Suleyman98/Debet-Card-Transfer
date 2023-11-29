import 'package:debet_card_transfer/app/app_colors.dart';
import 'package:debet_card_transfer/app/app_paddings.dart';
import 'package:debet_card_transfer/app/app_sized_box.dart';
import 'package:debet_card_transfer/app/app_text_styles.dart';
import 'package:debet_card_transfer/business_logic/cubits/home/home_cubit.dart';
import 'package:debet_card_transfer/services/models/user_model.dart';
import 'package:debet_card_transfer/presentation/global_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleUser extends StatelessWidget {
  const SingleUser({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: ListTile(
        title: Text(
          user.name,
          style: AppTextStyles.regularBlack,
        ),
        subtitle: Text(user.surname, style: AppTextStyles.regularBlack),
        trailing: Text(user.gsmNumber, style: AppTextStyles.boldTextBlack),
        leading: CustomElevatedButton(
          label: 'Transfer Money',
          onPressed: () {
            transferMoney(context, user);
          },
        ),
      ),
    );
  }
}

PersistentBottomSheetController<dynamic> transferMoney(
    BuildContext context, UserModel user) {
  return showBottomSheet(
    context: context,
    builder: (_) {
      return BlocProvider.value(
        value: context.read<HomeCubit>(),
        child: TransferModal(user: user),
      );
    },
  );
}

class TransferModal extends StatefulWidget {
  final UserModel user;
  const TransferModal({
    super.key,
    required this.user,
  });

  @override
  State<TransferModal> createState() => _TransferModalState();
}

class _TransferModalState extends State<TransferModal> {
  late final TextEditingController amount;
  @override
  void initState() {
    amount = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.h40,
      child: SizedBox(
        height: 550,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: amount,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            AppSizedBox.h40,
            CustomElevatedButton(
              label: 'Send',
              onPressed: () {
                context
                    .read<HomeCubit>()
                    .transferMoney(
                        double.parse(amount.text), widget.user, context)
                    .then((value) => Navigator.pop(context));
              },
            )
          ],
        ),
      ),
    );
  }
}
