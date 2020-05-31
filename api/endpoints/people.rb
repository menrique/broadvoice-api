namespace "/people" do

  get %r{/?} do
    query = params[:query]
    json Presenters::Resource.present(People::Repository.get(query[:data]), query[:presentation])
  end
end