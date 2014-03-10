# language: pt

Funcionalidade: Começar jogo
  Como jogador
  Quero poder começar um novo jogo

  Cenário: Começo de novo jogo ocorre com sucesso
    Ao começar o jogo, é mostrada uma mensagem inicial.

    Quando começo um novo jogo
    Então vejo na tela:
      """
      Bem vindo ao jogo da forca
      """