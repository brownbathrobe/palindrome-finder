require "sinatra"
require "shotgun"

get "/" do
  File.read(File.join("public", "index.html"))
end
