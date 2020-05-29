namespace "/companies" do

  get %r{/?} do
    json Presenters::Resource.render(Companies::Repository.get)
  end
end