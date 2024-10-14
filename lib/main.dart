import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  //Variável para controlar qual pergunta está atualmente na tela
  var _perguntaSelecionada = 0;

  //Variável que contém a pontuação total
  var _pontuacaoTotal = 0;

  //Função disparada ao responder uma pergunta
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        //Muda a pergunta
        _perguntaSelecionada++;
        //Adiciona pontuação da resposta a pontuação total
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  //Quando clicar no botão de reiniciar na tela do resultado
  void _reiniciarQuestionario() {
    setState(() {
      //Reinicia as perguntas
      _perguntaSelecionada = 0;
      //Zera a pontuação
      _pontuacaoTotal = 0;
    });
  }

  //Lista de perguntas
  //Podem ser adicionadas mais perguntas, assim como modificadas as atuais
  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 10},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Leo', 'pontuacao': 3},
        {'texto': 'Pedro', 'pontuacao': 1},
      ],
    }
  ];

  //Verifica se ainda tem alguma pergunta para mostrar
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
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}
