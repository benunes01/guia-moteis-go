import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/core/components/custom_shimmer.dart';
import 'package:teste/app/core/theme/theme_colors.dart';
import 'package:teste/app/features/home/presenter/components/motel_card.dart';
import 'package:teste/app/features/home/presenter/states/motel_state.dart';
import 'package:teste/app/features/home/presenter/stores/motel_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MotelStore store = Modular.get<MotelStore>();

  @override
  void initState() {
    super.initState();
    store.getAllMotels();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ThemeColors.kPrimary,
      body: Stack(
        children: [
          Positioned(
            top: height * 0.18,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.82,
              decoration: BoxDecoration(
                color: ThemeColors.kSecondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: BlocBuilder<MotelStore, MotelState>(
                bloc: store,
                builder: (context, state) => _buildMotelsList(state),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMotelsList(MotelState state) {
    if (state is MotelLoadInProgress) {
      return const Column(
        children: [
          CustomShimmer(
            height: 100,
          )
        ],
      );
    }

    if (state is MotelLoadFailure) {
      return const Center(
        child: Text(
          'Erro ao carregar motéis',
          style: TextStyle(color: ThemeColors.kFailure, fontSize: 18),
        ),
      );
    }

    if (state is MotelLoadSuccess) {
      final moteis = state.response.data.moteis;
      if (moteis.isEmpty) {
        return const Center(child: Text('Nenhum motel encontrado'));
      }

      return ListView.builder(
        padding: const EdgeInsets.only(top: 16),
        itemCount: moteis.length,
        itemBuilder: (context, index) {
          return MotelCard(motel: moteis[index]);
        },
      );
    }

    return const Center(child: Text('Nenhum dado disponível'));
  }
}
