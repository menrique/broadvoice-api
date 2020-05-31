namespace "/companies" do

  get %r{/?} do
    query = params[:query]
    json Presenters::Resource.present(Companies::Repository.get(query[:data]), query[:presentation])
  end

  get '/:id' do
    query = params[:query]
    json Presenters::Resource.present(
        Companies::Repository.get(filter: {id: params[:id]}).preload(:cities),
        query[:presentation].merge(include: {cities: {only: [:id, :name, :state]}})
    ).first
  end
end