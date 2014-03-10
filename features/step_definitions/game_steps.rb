# encoding: utf-8

Quando(/^começo um novo jogo$/) do
  # game = Game.new
  # game.start
  steps %{
    * I run `forca` interactively
  }
end

Então(/^vejo na tela:$/) do |string|
  steps %{
    * the stdout should contain "#{string}"
  }
end