# encoding: utf-8

Quando(/^começo um novo jogo$/) do
  game = Game.new
  game.start
end

Então(/^vejo a mensagem:$/) do |string|
  pending
end