class WordChainer
  attr_reader :dictionary
  def self.build
    dict = File.open("./dictionary.txt")
    set = []
    dict.each_line do |line|
      set << line.chomp
    end
    set.to_set
  end

  def initialize
    @dictionary = self.class.build
  end

  def adjacent_words(word)
    arr = []
    (0..word.length - 1).each do |idx|
      @dictionary.select do |dicts|
        x = word.dup
        y = dicts.dup

        arr << dicts if dicts.length == word.length && word_substr(y, idx) == word_substr(x, idx)
      end
    end
    arr
  end

  def word_substr(word, idx)
    word[idx] = "*"
    word
  end
end
