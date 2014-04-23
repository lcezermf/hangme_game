# language: pt

Funcionalidade: Fim do jogo
  O jogo termina em dois cenários:
    1. O jogador adivinhou todas as letras da palavra,
  então ele ganha! :)
    2. O jogador errou 6 vezes ao tentar adivinhar as letras da palavra,
  então ele perde. :(

  Contexto:
    * o jogo tem as possíveis palavras para sortear:
    |número de letras|palavra|
    |6               |slayer|

  Cenário: Jogador vence o jogo
    Para que o jogador possa vencer o jogo, ele precisa adivinhar todas
    as letras do jogo antes que todas as partes do boneco da forca
    apareçam.

    Dado que comecei um jogo
    E que escolhi que a palavra a ser sorteada deverá ter "6" letras
    Quando tento adivinhar que a palavra tem a letra "s"
    E tento adivinhar que a palavra tem a letra "l"
    E tento adivinhar que a palavra tem a letra "a"
    E tento adivinhar que a palavra tem a letra "y"
    E tento adivinhar que a palavra tem a letra "e"
    E tento adivinhar que a palavra tem a letra "r"
    Então o jogo termina com a seguinte mensagem na tela:
    """
    Você venceu! :)
    """

  @wip
  Cenário: Jogador perde o jogo
    Para que o jogador perca o jogo, basta que ele erre 6 vezes ao
    tentar adivinhar uma letra.

    Dado que comecei um jogo
      E que escolhi que a palavra a ser sorteada deverá ter "6" letras
      Quando tento adivinhar que a palavra tem a letra "z" "6" vezes
      Então o jogo termina com a seguinte mensagem na tela:
      """
      Você perdeu! :(
      """