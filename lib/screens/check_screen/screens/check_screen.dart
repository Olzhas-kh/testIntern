import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_intern/const/colors.dart';
import 'package:test_intern/core/injection_container.dart';
import 'package:test_intern/logic/check/bloc/check_bloc.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  bool checkBoxValue = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CheckBloc>()..add(CheckGetTodosEvents()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Check',
            ),
          ),
          body: BlocBuilder<CheckBloc, CheckState>(
            builder: (context, state) {
              if (state is CheckInitial) {
                return const Center(
                  child: Text(
                    "Initial State",
                  ),
                );
              }
              if (state is CheckLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CheckSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.getTodos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: ListTile(
                          tileColor:state.getTodos[index].completed?
                              ColorProject.listTileColor.withOpacity(0.24):
                              ColorProject.background
                              ,
                          leading: Checkbox(
                              side:
                                  BorderSide(color: ColorProject.checkBoxColor),
                              value: state.getTodos[index].completed,
                              activeColor: ColorProject.listTileColor,
                              checkColor: ColorProject.background,
                              onChanged: (newValue) {}),
                          title: Text(
                            state.getTodos[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                 color: state.getTodos[index].completed? ColorProject.white:ColorProject.white.withOpacity(0.54),
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              if (state is CheckFailed) {
                return Center(
                  child: Text(
                    state.errorMessage,
                  ),
                );
              }
              return const Offstage();
            },
          )),
    );
  }
}
