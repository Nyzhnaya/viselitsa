class Game

  def initialize(slovo)
    @letters = get_letters(slovo)

    @errors = 0

    @good_letters = []
    @bad_letters = []

    @status = 0

  end

  def get_letters(slovo)

    if (slovo == nil || slovo == "")
      abort "Вы не ввели слово для игры"
    end

    return slovo.split("")
  end

  def status
    return @status
  end

  def next_step(bykva)

    if @status == -1 || @status == 1
      return
    end

    if @good_letters.include?(bykva) || @bad_letters.include?(bykva)
      return
    end

    if @letters.include?(bykva)
      @good_letters << bykva

      if @good_letters.uniq.sort == @letters.uniq.sort
        @status == 1
      end

    else

      @bad_letters << bykva

      @errors += 1

      if @errors >= 7
        @status = -1
      end
    end
  end

  # 1. спросить букву с консоли
  # 2. проверить результат
  def ask_next_letter
    puts "\nВведите следующую букву"

    letter = ""

    while letter == "" do
      letter = STDIN.gets.chomp
    end

    next_step(letter)
  end

  def letters
    @letters
  end

  def good_letters
    @good_letters
  end

  def bad_letters
    @bad_letters
  end

  def status
    @status
  end

  def errors
    @errors
  end
end

