import 'package:auto_route/auto_route.dart';
import 'package:digirh/core/routes/app_router.gr.dart';
import 'package:digirh/features/conge/data/models/supervisor_conge_model.dart';
import 'package:digirh/features/conge/presentation/bloc/bloc.dart';
import 'package:digirh/features/conge/presentation/widgets/supervisor_conge_card.dart';
import 'package:digirh/main.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class SupervisorCongeScreen extends StatefulWidget implements AutoRouteWrapper {
  const SupervisorCongeScreen({super.key});

  @override
  State<SupervisorCongeScreen> createState() => _SupervisorCongeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => CongeBloc()..add(GetSupervisorCongesEvent()),
        child: this,
      );
}

class _SupervisorCongeScreenState extends State<SupervisorCongeScreen> {
  ValueNotifier<List<SupervisorLeaveModel>> conges =
      ValueNotifier<List<SupervisorLeaveModel>>([]);

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
              if (state is GetSupervisorCongesSuccess) {
                setState(() {
                  conges.value = state.conges;
                });
              }
              if (state is AcceptCongeSuccess) {
                setState(() {
                  conges.value = state.conges;
                });
              }
              if (state is RejectCongeSuccess) {
                setState(() {
                  conges.value = state.conges;
                });
              }
            },
            child: Column(
              children: [
                largeVerticalSpacer,
                _buildHeader(),
                largeVerticalSpacer,
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
              'Demandes Congé',
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

  Widget _buildCongeList() {
    return ValueListenableBuilder(
      valueListenable: conges,
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            final conge = value[index];
            return SupervisorCongeCard(
              conge: conge,
              onAccept: () {
                context.read<CongeBloc>().add(
                      AcceptCongeEvent(congeId: conge.id!),
                    );
              },
              onReject: () {
                context.read<CongeBloc>().add(
                      RejectCongeEvent(congeId: conge.id!),
                    );
              },
            );
          },
        );
      },
    );
  }
}
