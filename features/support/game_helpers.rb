module GameHelpers

  def set_raffleable_words(words)
    @raffleable_words = words
  end

  def start_new_game()
    set_raffleable_words %w(metallica slayer kreator anthrax megadeth slipknot) unless @raffleable_words
    run_interactive 'forca'
  end

end

World GameHelpers