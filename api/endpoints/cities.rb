namespace "/cities" do

  get %r{/?} do
    query = params[:query]
    json Presenters::Resource.present(Cities::Repository.get(query[:data]), query[:presentation])
  end
end