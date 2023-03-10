class ResultPrinter

  def initialize

    @status_image = []

    current_path = File.dirname(__FILE__)

    counter = 0

    while counter <= 7
      file_name = current_path + "/image/#{counter}.txt"

      if File.exist?(file_name)
        file = File.new(file_name)
        @status_image << file.read
        puts @status_image
        file.close
      else
        @status_image << "\n[ Изображение не найдено ] \n"
      end

      counter += 1
    end
  end

  def print_viselitsa(errors)
    # puts "!!!!Method print_viselitsa called!!!"
    puts @status_image[errors]

  end

  def print_status(game)
    cls
    puts
    puts "\nСлово: #{get_word_for_print(game.letters, game.good_letters)}"

    puts "Ошибки: #{game.bad_letters.join(", ")}"

    print_viselitsa(game.errors)

    if game.status == -1
      puts
      puts "Вы проиграли :("
      puts "Загаданное слово было: " + game.letters.join("")
      puts

    elsif game.status == 1
      puts
      puts "Поздравляем! Вы выиграли!"
      puts
    else
      puts "У Вас осталось ошибок: " + (7 - game.errors).to_s
    end
  end

  def get_word_for_print(letters, good_letters)

    result = ""

    for item in letters do
      if good_letters.include?(item)
        result += item + " "
      else
        result += "__ "
      end
    end

    return result
  end

  def cls
    system "clear"
  end
end