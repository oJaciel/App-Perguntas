import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto' : 'Preto', 'nota': 10}, 
        {'texto' : 'Vermelho', 'nota': 5}, 
        {'texto' : 'Verde', 'nota': 3}, 
        {'texto' : 'Branco', 'nota': 1},
        ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto' : 'Coelho', 'nota': 10}, 
        {'texto' : 'Cobra', 'nota': 5}, 
        {'texto' : 'Elefante', 'nota': 3}, 
        {'texto' : 'Leão', 'nota': 1},
        ],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto' : 'Maria', 'nota': 10}, 
        {'texto' : 'João', 'nota': 5}, 
        {'texto' : 'Leo', 'nota': 3}, 
        {'texto' : 'Pedro', 'nota': 1},
        ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntaSelecionada: _perguntaSelecionada,
                  perguntas: _perguntas,
                  quandoResponder: _responder)
              : const Resultado()),
    );
  }
}
