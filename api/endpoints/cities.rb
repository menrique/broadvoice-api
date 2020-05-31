namespace "/cities" do

  get %r{/?} do
    query = params[:query]
    json Presenters::Resource.present(Cities::Repository.get(query[:data]), query[:presentation])
  end

  get '/:id' do
    query = params[:query]
    json Presenters::Resource.present(
        Cities::Repository.get(filter: {id: params[:id]}).preload(:companies),
        query[:presentation].merge(include: {companies: {only: [:id, :name]}})
    ).first
  end
end