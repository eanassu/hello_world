# hello_world

A new Flutter project.
Projeto piloto para disciplina de computação para dispositivos móveis

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Fora estas referências, estou fazendo a aplicação com as seguintes características:
- Uma tela simples de cálculo
- Uma tela com slider para cálculo de gorjeta
- Uma tela para manipulação de banco de dados interno
    Para esta tela funcionar na WEB, além das dependências colocadas no pubspec.yaml, é necessário instalar
    o banco de dados local versão WEB com o comando:
  
  dart run sqflite_common_ffi_web:setup

  As versões desktop e mobile não necessitam disso
- Uma tela para Manipulação dos sensores do celular (funcionaria somente com emulador)
- Tela para desenho com toque
- Tela usando Maps (em desenvolvimento)

Sugestões são bem vindas: eanassu@gmail.com
