import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:digirh/core/routes/app_router.gr.dart';
import 'package:digirh/features/conge/data/models/conge_model.dart';
import 'package:digirh/features/conge/presentation/bloc/bloc.dart';
import 'package:digirh/features/conge/presentation/widgets/conge_card.dart';
import 'package:digirh/main.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class CongeScreen extends StatefulWidget implements AutoRouteWrapper {
  const CongeScreen({Key? key}) : super(key: key);

  @override
  State<CongeScreen> createState() => _CongeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => CongeBloc()..add(GetCongesEvent()),
        child: this,
      );
}

class _CongeScreenState extends State<CongeScreen> {
  ValueNotifier<List<LeaveModel>> conges = ValueNotifier<List<LeaveModel>>([]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .075,
          ),
          child: BlocListener<CongeBloc, CongeState>(
            listener: (context, state) {
              if (state is GetCongesSuccess) {
                setState(() {
                  conges.value = state.conges;
                });
              }
              if (state is DeleteCongeSuccess) {
                setState(() {
                  conges.value = state.conges;
                });
              }
              if (state is SubmitCongeSuccess) {
                setState(() {
                  conges.value = state.conges;
                });
              }
              if (state is AddCongeSuccess) {
                setState(() {
                  conges.value = state.conges;
                });
              }
            },
            child: Column(
              children: [
                largeVerticalSpacer,
                _buildHeader(),
                smallVerticalSpacer,
                _buildCongeInfo(),
                extraSmallVerticalSpacer,
                _buildNewCongeButton(),
                smallVerticalSpacer,
                Expanded(
                  child: _buildCongeList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => MyApp.scaffoldKey.currentState?.openDrawer(),
          child: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.whiteDarkColor,
            ),
            child: SvgPicture.asset('assets/svg/menu.svg'),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Congé',
              style: TextStyles.extraExtraLargeTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.whiteDarkColor,
          ),
          child: SvgPicture.asset('assets/svg/notification.svg'),
        )
      ],
    );
  }

  Widget _buildCongeInfo() {
    return Column(
      children: [
        Text(
          "59",
          style: TextStyles.extraExtraLargeTextStyle.copyWith(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Encore congé annuelle par jour",
          style: TextStyles.mediumTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildNewCongeButton() {
    return GestureDetector(
      onTap: () => context.router.push(DemandeCongeRoute(
        onAdd: (p0) {
          context.read<CongeBloc>().add(
                AddCongeEvent(conge: p0),
              );
          context.router.back();
        },
      )),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.primaryDarkColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/svg/plus_outline.svg"),
            miniHorizantalSpacer,
            Text(
              "Nouvelle demande de congé",
              style: TextStyles.mediumTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.whiteDarkColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCongeList() {
    return ValueListenableBuilder(
      valueListenable: conges,
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            final conge = value[index];
            return CongeCard(
              conge: conge,
              onDelete: () {
                context.read<CongeBloc>().add(
                      DeleteCongeEvent(id: conge.id!),
                    );
              },
              onSubmit: () {
                context.read<CongeBloc>().add(
                      SubmitCongeEvent(congeId: conge.id!),
                    );
              },
            );
          },
        );
      },
    );
  }
}
