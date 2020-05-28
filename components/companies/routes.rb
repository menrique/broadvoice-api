namespace "/companies" do

  get %r{/?} do
    json Companies::Repository.get
  end
end