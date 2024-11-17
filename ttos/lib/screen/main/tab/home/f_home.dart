import 'package:live_background/widget/live_background_widget.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/common/widget/w_big_button.dart';
import 'package:ttos/common/widget/w_rounded_container.dart';
import 'package:ttos/screen/dialog/d_message.dart';
import 'package:flutter/material.dart';
import 'package:ttos/screen/main/s_main.dart';
import 'package:ttos/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:ttos/screen/main/tab/home/w_bank_account.dart';
import 'package:ttos/screen/main/tab/home/w_rive_like_button.dart';
import 'package:ttos/screen/main/tab/home/w_ttos_app_bar.dart';

import '../../../dialog/d_color_bottom.dart';
import '../../../dialog/d_confirm.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Stack(
          children: [
            const LiveBackgroundWidget(),
            RefreshIndicator(
              edgeOffset: TtosAppBar.appBarHeight,
              onRefresh: () async {
                await sleepAsync(500.ms);
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: TtosAppBar.appBarHeight,
                  bottom: MainScreenState.bottomNavigatorHeight,
                ),
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    height10,
                    SizedBox(
                      height: 250,
                      width: 250,
                      child: RiveLikeButtonWidget(
                        isLike,
                        onTapLike: (isLike) =>
                            setState(() => this.isLike = isLike),
                      ),
                    ),
                    BigButton('또스뱅크', onTap: () {
                      context.showSnackbar('또스뱅크를 눌렀어요');
                    }),
                    height10,
                    RoundedContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          '자산'.text.bold.white.make(),
                          height5,
                          ...bankAccounts
                              .map((e) => BankAccountWidget(e))
                              .toList()
                        ],
                      ),
                    ),
                  ],
                ).pSymmetric(h: 20),
                // .animate()
                // .slideY(duration: 1000.ms)
                // .fadeIn(duration: 1000.ms),
              ),
            ),
            const TtosAppBar(),
          ],
        ));
  }

  void showSnackbar(BuildContext context) {
    context.showSnackbar('snackbar 입니다.',
        extraButton: Tap(
          onTap: () {
            context.showErrorSnackbar('error');
          },
          child: '에러 보여주기 버튼'
              .text
              .white
              .size(13)
              .make()
              .centered()
              .pSymmetric(h: 10, v: 5),
        ));
  }

  Future<void> showConfirmDialog(BuildContext context) async {
    final confirmDialogResult = await ConfirmDialog(
      '오늘 기분이 좋나요?',
      buttonText: "네",
      cancelButtonText: "아니오",
    ).show();
    debugPrint(confirmDialogResult?.isSuccess.toString());

    confirmDialogResult?.runIfSuccess((data) {
      ColorBottomSheet(
        '❤️',
        context: context,
        backgroundColor: Colors.yellow.shade200,
      ).show();
    });

    confirmDialogResult?.runIfFailure((data) {
      ColorBottomSheet(
        '❤️힘내여',
        backgroundColor: Colors.yellow.shade300,
        textColor: Colors.redAccent,
      ).show();
    });
  }

  Future<void> showMessageDialog() async {
    final result = await MessageDialog("안녕하세요").show();
    debugPrint(result.toString());
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
