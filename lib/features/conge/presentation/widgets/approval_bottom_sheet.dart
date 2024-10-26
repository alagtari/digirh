import 'package:digirh/features/conge/presentation/bloc/bloc.dart';
import 'package:digirh/features/conge/presentation/widgets/conge_approuval_card.dart';
import 'package:digirh/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApprovalBottomSheet extends StatelessWidget {
  const ApprovalBottomSheet({super.key, required this.congeId});

  final String congeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CongeBloc()..add(GetCongeSupervisorsEvent(congeId: congeId)),
      child: Container(
        height: MediaQuery.of(context).size.height * .45,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          color: AppColors.whiteDarkColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: BlocBuilder<CongeBloc, CongeState>(
          builder: (context, state) {
            if (state is GetCongeSupervisorsSuccess) {
              final supervisors = state.supervisors;
              return ListView.builder(
                itemCount: supervisors.length,
                itemBuilder: (context, index) {
                  final supervisor = supervisors[index];
                  return CongeApprouvalCard(supervisor: supervisor);
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
