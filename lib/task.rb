# Подключим встроенный в руби класс Date для работы с датами
require 'date'
class Task < Post
  def initialize
    # Вызовем одноимённый метод (initialize) родителя (Post) методом super
    super
    # А потом добавим то, что будет отличаться у ребёнка — поле @due_date
    @due_date = ''
  end
  def read_from_console
    # Мы полностью переопределяем метод read_from_console родителя Post
    # Спросим у пользователя, что за задачу ему нужно сделать
    # Одной строчки будет достаточно
    puts "What do you need to do?"
    @text = $stdin.gets.chomp
    # А теперь спросим у пользователя, до какого числа ему нужно это сделать
    # И подскажем формат, в котором нужно вводить дату
    puts "By what date do you need to do this?"
    puts "Specify the date in the format DD.MM.YYYY, for example 12.05.2003"
    input = $stdin.gets.chomp
    # Для того, чтобы записть дату в удобном формате, воспользуемся методом parse класса Time
    @due_date = Date.parse(input)
  end
  def save
    file = File.new(file_path, "w:UTF-8")
    time_string = @created_at.strftime("%Y.%m.%d, %H:%M")
    file.puts(time_string + "\n\r")
    # Так как поле @due_date указывает на объект класса Date, мы можем вызвать у него метод strftime
    # Подробнее о классе Date читайте по ссылкам в материалах
    file.puts("Make to #{@due_date.strftime("%Y.%m.%d")}")
    file.puts(@text)
    file.close
    # Напишем пользователю, что задача добавлена
    puts "Your record is saved"
  end
end
