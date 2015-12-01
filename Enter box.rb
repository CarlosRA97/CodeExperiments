Shoes.app do
  background "#EFC"
  border("#BE8",
         strokewidth: 6)

  stack(margin: 12) do
  	  key = ""
      para "Enter your name"
      flow do
      	@text = edit_line
        @b = button "OK"
        @b.click { @text.text(key) }
        end
      end
    end
end