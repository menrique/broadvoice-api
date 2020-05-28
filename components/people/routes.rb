namespace "/people" do

  get %r{/?} do
    json People::Repository.get
  end
end