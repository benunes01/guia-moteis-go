# Projeto Flutter

Listagem de base de dados (moteis)

A arquitetura utilizada no projeto segue uma versão simplificada do Clean Architecture, incorporando princípios do SOLID e usando o Modular para injeção de dependências. A intenção é demonstrar boas práticas e organização de código, mantendo a simplicidade.

Foi utilizado um mecanismo de fallback para retentar a busca com uma segunda url.

https://github.com/user-attachments/assets/df7ec0c6-952f-40f6-8847-46937acd2975

### Testes unitarios
```sh
flutter test
```
Foi criado uma função 'mocked' para cada model, facilitando o teste unitário!

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

## Gerenciamento de Estado

Para o gerenciamento de estado, foi utilizado o **Bloc**.

## Rodar o projeto

```sh
flutter pub get

flutter run
