namespace "/people" do

  get %r{/?} do
    json Presenters::Resource.render(People::Repository.get)
  end
end