

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)
      item = req.path.split('/')[2]
      if @@items.find {|i| i.name == item}
        req_item = @@items.find {|i| i.name == item }
        resp.write "#{req_item.price}"
      else
        resp.write "Item not found."
        resp.status = 400  
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end 