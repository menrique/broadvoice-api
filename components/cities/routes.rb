namespace "/cities" do

  get %r{/?} do
    json Cities::Repository.get
  end
end