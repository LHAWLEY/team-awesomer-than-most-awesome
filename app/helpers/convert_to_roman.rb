def convert_to_roman(arabic_number)
  ms = arabic_number / 1000
  arabic_number -= ms * 1000
  ds = arabic_number / 500
  arabic_number -= ds * 500
  cs = arabic_number / 100
  arabic_number -= cs * 100
  ls = arabic_number / 50
  arabic_number -= ls * 50
  xs = arabic_number / 10
  arabic_number -= xs * 10
  vs = arabic_number / 5
  arabic_number -= vs * 5
  is = arabic_number

  p old_roman_numeral = ('M' * ms) + ('D' * ds) + ('C' * cs) + ('L' * ls) + ('X' * xs) + ('V' * vs) + ('I' * is)
  old_roman_numeral.gsub(/VIIII/, 'IX').gsub(/LXXXX/, 'XC').gsub(/DCCCC/, 'CM').gsub(/IIII/, 'IV').gsub(/XXXX/, 'XL').gsub(/CCCC/, 'CD')
end
