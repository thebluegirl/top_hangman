def word_picker
  word = File.open("/home/funto/repos/top_hangman/google-10000-english-no-swears.txt").readlines.sample.chomp

  if word.length >= 5 && word.length <= 12
    return word
  else
    word = word_picker
  end
end
