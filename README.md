# Projeto Flutter (Guia de Moteis GO)

Listagem de base de dados (moteis)

A arquitetura utilizada no projeto segue uma versão simplificada do Clean Architecture, incorporando princípios do **SOLID** e usando o Modular para injeção de dependências. A intenção é demonstrar boas práticas e organização de código, mantendo a simplicidade.

- Listagem de motéis seguindo o design do aplicativo existente.
<br>
- Consumo de duas APIs externas:
**Foi utilizado um mecanismo de fallback para retentar a busca com a segunda url.**
<br>
- Tratamento de erros.
<br>
- Criação de ThemeColors e ThemeTypography para reutilizar constantes de style e color.

https://github.com/user-attachments/assets/df7ec0c6-952f-40f6-8847-46937acd2975

### Testes unitarios com lcov

Criei um makefile para que possa usar o coverage do lcov e verificar a cobertura de teste
```sh
make run_coverage
```

![Captura de Tela 2025-02-10 às 00 45 25](https://github.com/user-attachments/assets/9fc44cfb-2709-4afa-9b97-c5e6838725fe)

Foi criado uma função 'mocked' para cada model, facilitando o reaproveitamento para os testes unitários!

## Versões Utilizadas

- **Flutter:** 3.27.3 (channel stable)
- **Dart:** 3.6.1

## Packages
flutter_modular

result_dart

flutter_bloc

http

equatable

shimmer

mockito

## Gerenciamento de Estado

Para o gerenciamento de estado, foi utilizado o **Bloc**.

## Rodar o projeto

```sh
flutter pub get

flutter run
