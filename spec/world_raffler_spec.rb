require 'spec_helper'
require 'word_raffler'

describe WordRaffler do

  before do
    words = %w(metallica slayer kreator anthrax megadeth slipknot)
    @word_raffler = WordRaffler.new words
  end

  it 'raffle a word from a list of words' do
    expect(@word_raffler.raffle(6)).to eql('slayer')
    expect(@word_raffler.raffle(7)).to eql('kreator')
    expect(@word_raffler.raffle(8)).to eql('megadeth')
    expect(@word_raffler.raffle(9)).to eql('metallica')
  end

  it 'return nil if there is no worl with the given size' do
    expect(@word_raffler.raffle(12)).to be_nil
  end

end