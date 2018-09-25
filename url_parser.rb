require 'uri'

class UrlParser 
  attr_accessor :scheme, :domain, :port, :path, :query_string, :fragment_id
  def initialize(url)
    uri = URI::parse(url)
    @scheme = uri.scheme
    @domain = uri.host
    @port = uri.port.to_s
    @path = uri.path.tr("/","") unless uri.path == "/"
    @query_string = Hash[uri.query.tr("=&"," ").split(/\W+/).each_slice(2).to_a] unless uri.query == nil
    @fragment_id = uri.fragment
  end
end
