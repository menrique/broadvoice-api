namespace "/cities" do

  get %r{/?} do
    json Presenters::Resource.render(Cities::Repository.get)
  end
end