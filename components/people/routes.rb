namespace "/people" do

  get %r{/?} do
    json Presenters::Resource.present(People::Repository.get, except: [:created_at, :updated_at])
  end
end