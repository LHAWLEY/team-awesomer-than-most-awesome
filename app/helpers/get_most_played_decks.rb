helpers do
  def most_played(decks)
    public_decks = []
    decks.each do |deck|
    	if deck.is_public
    		public_decks << deck
    	end
    end
    public_decks
  end
end
