namespace "/companies" do

  get %r{/?} do
    query = params[:query]
    json Presenters::Resource.present(Companies::Repository.get(query[:data]), query[:presentation])
  end
end