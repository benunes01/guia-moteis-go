import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/core/theme/theme_colors.dart';
import 'package:teste/app/features/home/presenter/components/motel_card.dart';
import 'package:teste/app/features/home/presenter/states/motel_state.dart';
import 'package:teste/app/features/home/presenter/stores/motel_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MotelStore store = Modular.get<MotelStore>();

    return Scaffold(
      backgroundColor: ThemeColors.kPrimary,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.18,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.82,
              decoration: BoxDecoration(
                color: ThemeColors.kSecondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: BlocBuilder<MotelStore, MotelState>(
                bloc: store..getAllMotels(),
                builder: (context, state) {
                  if (state is MotelLoadInProgress) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is MotelLoadFailure) {
                    return const Center(
                      child: Text(
                        'Erro ao carregar motéis',
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    );
                  }
                  if (state is MotelLoadSuccess) {
                    return SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          state.response.data.moteis.length,
                              (index) {
                            final motel = state.response.data.moteis[index];
                            return MotelCard(motel: motel);
                          },
                        ),
                      ),
                    );
                  }
                  return const Center(child: Text('Nenhum dado disponível'));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
