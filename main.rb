x, y, x_user, y_user = ARGV

if x == x_user && y == y_user
	puts "Точка найдена!"
elsif x != x_user && y != y_user
	puts "Близко, но нет"
elsif x == x_user && y != y_user
	puts "х координата верна, y нет"
elsif x != x_user && y == y_user
	puts "y координата верна, x нет"
end


		
		