class HTTPPost

  attr_reader :headers, :body, :uri, :response

  def initialize uri:, body:, headers: {}
    @uri = uri.is_a?(String) ? URI(uri) : uri
    @body = body
    @headers = headers
  end

  def request
    req = Net::HTTP::Post.new(uri)
    req.body = body
    req['Content-Type'] = 'application/json'
    req['Accept'] = 'application/json'
    req['Authorization'] = 'key=AIzaSyAseiLY28mGXTIVGZLQssb4K-hj9TUg6iU'
    headers.each_pair do |key, value|
      req[key] = value
    end
    req
  end

  def start
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request request
    end
  end
end
