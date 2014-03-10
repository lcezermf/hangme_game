# encoding: utf-8

Quando(/^começo um novo jogo$/) do
  run_interactive("forca")
end

Então(/^vejo na tela:$/) do |string|
  assert_partial_output(string, all_stdout)
end