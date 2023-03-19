# Подключаем класс Post и его детей
require_relative 'lib/post.rb'
require_relative 'lib/memo.rb'
require_relative 'lib/link.rb'
require_relative 'lib/task.rb'
# Как обычно, при использовании классов программа выглядит очень лаконично
puts "Hi, I'm your notebook!"
# Теперь надо спросить у пользователя, что он хочет создать
puts "What do you want to write in a notebook?"
# массив возможных видов Записи (поста)
choices = Post.post_types
choice = -1
until choice >= 0 && choice < choices.size # пока юзер не выбрал правильно
  # выводим заново массив возможных типов поста
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end
  choice = gets.chomp.to_i
end
# выбор сделан, создаем запись с помощью стат. метода класса Post
entry = Post.create(choice)
# сейчас в переменной entry лежит один из детей класса Post, какой именно,
# определилось выбором пользователя, переменной choice.
# Но мы не знаем какой, и обращаемся с entry как с объектом класса Post, этого, оказывается, достаточно.
# Просим пользователя ввести пост (каким бы он ни был)
entry.read_from_console
# Сохраняем пост в файл
entry.save
puts "Your record is saved!"
