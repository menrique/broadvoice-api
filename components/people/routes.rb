namespace "/people" do

  get %r{/?} do
    json route: 'GET /people'
  end
end