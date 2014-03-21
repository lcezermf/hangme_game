# language: pt

Funcionalidade: Começar jogo
  Como jogador
  Quero poder começar um novo jogo

  Cenário: Começo de novo jogo ocorre com sucesso
    Ao começar o jogo, é mostrada uma mensagem inicial.

    Quando começo um novo jogo
    E termino o jogo
    Então o jogo termina com a seguinte mensagem na tela:
      """
      Bem vindo ao jogo da forca
      """

  Cenário: Sortear uma palavra
    Após começar o jogo, o jogador pode escolher o tamanho da palavra.
    Ao escolher o tamanho, o jogo mostra um "_" para cada letra da palavra.

    Dado que comecei um jogo
    Quando escolho que a palavra deverá ter '6' letras
    E termino o jogo
    Então o jogo termina com a seguinte mensagem na tela:
      """
      _ _ _ _ _ _
      """

  Cenário: Sortear palavra sem sucesso
    Se o jogador pedir para o jogo sortear uma palavra com tamanho indisponível,
    o jogador deverá ser avisado e o jogo deve pedir para o jogador sortear outra palavra.

    Dado que comecei um jogo
    Quando escolho que a palavra deverá ter '22' letras
    E termino o jogo
    Então o jogo termina com a seguinte mensagem na tela:
    """
    Não temos palavras com o tamanho desejado. Qual o tamanho da palavra a ser sorteada?
    """