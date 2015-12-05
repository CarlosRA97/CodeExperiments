require 'OpenSSL'

Shoes.app title: "Encrypter", width: 312, height: 60 do
  class Actions
	  	@myApp
		def initialize(myApp)
			@myApp = myApp
		end
		def data_encrypt(key)
			@myApp.app do
				digest = OpenSSL::Digest.new('sha1', key)
				return digest
			end
		end

		def pbcopy(input)
			@myApp.app do
				str = input.to_s
				IO.popen('pbcopy', 'w') { |f| f << str }
				str
				exit()
			end
		end
  end

  background white

  stack margin: 0, margin_top: 0 do
    stack margin_left: 5, margin_right: 5, width: 1.0, height: 15 do
      background white
      border white, strokewidth: 3
      @gui_todo = para
    end

    flow margin_top: 0, margin_left: 10 do
	    
	  @myActions = Actions.new(self)
	  
      para "Hash me"
      @add = edit_line(margin_left: 10, width: 150)
      button("hash", margin_left: 2) do 
	      @myActions.pbcopy(@myActions.data_encrypt(@add.text))
	  end
    end
  end

  @gui_completed = stack width: 1.0, height: 10, margin_right: 20
  
end
