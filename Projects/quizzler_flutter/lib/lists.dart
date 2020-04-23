import 'question.dart';

List<Question> questionBank = [
  Question(
      q: 'Dentre as alternativas a seguir, qual não faz parte de um item de hardware?',
      a1: 'Mouse',
      a2: 'Processador',
      a3: 'Debian',
      r: [false, false, true]),

  Question(
      q: 'Selecione a opção abaixo que não caracteriza uma medida de segurança para seu computador.',
      a1: 'Deixar o Firewall ativado',
      a2: 'Utilizar o desfragmentador de discos do windows',
      a3: 'Mascarar seu endereçamento IP utilizando o proxy',
      r: [false, true, false]),

  Question(
      q: 'SQL ou Linguagem de Consulta Estruturada é a linguagem padrão para consultas e alterações de dados em bancos de dados relacionais. No laboratório de qual empresa famosa de informática foi desenvolvida essa linguagem?',
      a1: 'IBM',
      a2: 'Microsoft',
      a3: 'Oracle',
      r: [true, false, false])
];
