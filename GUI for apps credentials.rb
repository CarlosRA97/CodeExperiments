Shoes.app :title => 'First Ruby GUI in Shoes', :height => 150, :width => 250 do

	stack do

		edit_line
		edit_line

		button 'Login' do

			doLogin(username.text, password.text)

		end

	end

	def doLogin(username, password)

		if username == "connor" and password == "test"
			alert "Successful Login"
		else
			alert "Incorrect username/password combination"
		end
	end
end