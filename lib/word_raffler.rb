class WordRaffler

  def initialize(words = %w(metallica slayer kreator anthrax megadeth slipknot))
    @words = words
  end

  def raffle(size)
    @words.detect { |word| word.size.eql? size }
  end

end