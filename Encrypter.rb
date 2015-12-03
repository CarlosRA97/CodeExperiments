require 'OpenSSL'

Shoes.app title: "Encrypter", width: 312, height: 60 do
  background white

  stack margin: 0, margin_top: 0 do
    stack margin_left: 5, margin_right: 5, width: 1.0, height: 15 do
      background white
      border white, strokewidth: 3
      @gui_todo = para
    end

    flow margin_top: 0, margin_left: 10 do
      para "Hash me"
      @add = edit_line(margin_left: 10, width: 150)
      button("hash", margin_left: 2)  { act.pbcopy(act.data_encrypt(@add.text)) }
    end
  end

  @gui_completed = stack width: 1.0, height: 10, margin_right: 20
  
  class Actions
		def initialization
		end
		def data_encrypt(key)
			digest = OpenSSL::Digest.new('sha1', key)
			return digest
		end

		def pbcopy(input)
			str = input.to_s
			IO.popen('pbcopy', 'w') { |f| f << str }
			str
			exit()
		end
  end
  act = Actions.new
end
