namespace "/companies" do

  get %r{/?} do
    json Presenters::Resource.present(Companies::Repository.get, except: [:created_at, :updated_at])
  end
end