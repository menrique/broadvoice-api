namespace "/companies" do

  get %r{/?} do
    json route: 'GET /companies'
  end
end