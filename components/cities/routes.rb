namespace "/cities" do

  get %r{/?} do
    json route: 'GET /cities'
  end
end