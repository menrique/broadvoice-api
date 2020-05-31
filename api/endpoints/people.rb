namespace "/people" do

  get %r{/?} do
    query = params[:query]
    json Presenters::Resource.present(People::Repository.get(query[:data]), query[:presentation])
  end

  get '/:id' do
    query = params[:query]
    json Presenters::Resource.present(
        People::Repository.get(filter: {id: params[:id]}).preload(:companies, :cities),
        query[:presentation].merge(include: { companies: {only: [:id, :name]}, cities: {only: [:id, :name, :state]}})
    ).first
  end
end