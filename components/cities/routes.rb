namespace "/cities" do

  get %r{/?} do
    json Presenters::Resource.present(Cities::Repository.get, except: [:created_at, :updated_at])
  end
end