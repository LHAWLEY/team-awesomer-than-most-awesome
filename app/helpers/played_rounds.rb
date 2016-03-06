def played_rounds(userid)
  number = Round.where(user_id: userid).count - 1
  date = Round.where(user_id: userid).sort{|a,b| a.created_at <=> b.created_at }.last.created_at
  return number,date
end
