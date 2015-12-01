require 'OpenSSL'

Shoes.app title: "sha1 Generator" do

  digest = OpenSSL::Digest.new('sha1', key)

  def pbcopy(input)
    str = input.to_s
    IO.popen('pbcopy', 'w') { |f| f << str }
    str
  end

  stack do
      edit_line
      button("Add", margin_left: 5)  { pbcopy(@add.text) }
  end
end