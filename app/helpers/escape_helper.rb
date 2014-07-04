require 'cgi'

helpers do
  # When inserting a string into a URL, special characters must be escaped
  # or the URL is invalid
  #
  def escape_string(str)
    CGI.escape(str)
  end
end
