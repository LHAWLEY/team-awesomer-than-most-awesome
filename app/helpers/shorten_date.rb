def shorten_date(deck)
  date,foo,bar = deck.created_at.to_s.split(/ /)
  return date
end
