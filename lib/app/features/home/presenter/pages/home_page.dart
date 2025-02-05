import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/core/theme/theme_colors.dart';
import 'package:teste/app/core/theme/theme_typography.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: ThemeColors.kSecondary,
                borderRadius: BorderRadius.only(
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
                    return Center(
                      child: Text(
                        'Erro ao carregar motéis',
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    );
                  }

                  if (state is MotelLoadSuccess) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      shrinkWrap: true,
                      itemCount: state.response.data.moteis.length,
                      itemBuilder: (context, index) {
                        final motel = state.response.data.moteis.elementAt(index);
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    child: Image.network(motel.logo, width: 80, height: 80, fit: BoxFit.cover),
                                  ),
                                  const SizedBox(width: 6,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(motel.fantasia,
                                        style: ThemeTypography.headline1.copyWith(
                                            color: ThemeColors.kTextLight,
                                        ),
                                      ),
                                      const SizedBox(height: 4,),
                                      Text(motel.bairro,
                                        style: ThemeTypography.sub1
                                      ),
                                      const SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: ThemeColors.kStar),
                                              borderRadius: BorderRadius.circular(6)
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: ThemeColors.kStar,
                                                  size: 14,
                                                ),
                                                const SizedBox(width: 2,),
                                                Text(
                                                  motel.media.toString(),
                                                  style: ThemeTypography.sub1.copyWith(
                                                    fontWeight: FontWeight.w500
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 8,),
                                          Text('${motel.qtdAvaliacoes} avaliações')
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 400,
                                child: ListView.builder(
                                    padding: const EdgeInsets.all(16),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: motel.suites.length,
                                    itemBuilder: (context, index) {
                                      final suite = motel.suites.elementAt(index);
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(12),
                                              child: Image.network(
                                                suite.fotos.elementAt(0),
                                                width: MediaQuery.of(context).size.width - 118,
                                                height: 250,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 8,),
                                          Text(suite.nome)
                                        ],
                                      );
                                    },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
