# Utility method to compose proper server URL
def url(path)
  "http://localhost:#{ENV['PORT']}/#{path}"
end