# Класс Ссылка, разновидность базового класса "Запись"
class Link < Post

  def initialize
    super # вызываем конструктор родителя
    # потом инициализируем специфичное для ссылки поле
    @url = ''
  end

  def read_from_console
    # Мы полностью переопределяем метод read_from_console родителя Post
    # Попросим у пользователя адрес ссылки
    puts "Enter the link address"
    @url = $stdin.gets.chomp
    # И описание ссылки (одной строчки будет достаточно)
    puts "Write a few words about where the link leads"
    @text = $stdin.gets.chomp
  end

  def save
    # Метод save во многом повторяет метод родителя, но отличия существенны
    file = File.new(file_path, "w:UTF-8")
    time_string = @created_at.strftime("%Y.%m.%d, %H:%M")
    file.puts(time_string + "\n\r")
    # Помимо текста мы ещё сохраняем в файл адрес ссылки
    file.puts(@url)
    file.puts(@text)
    file.close
    # Напишем пользователю, что запись добавлена
    puts "Your link is saved"
  end
end
