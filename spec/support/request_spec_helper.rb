module RequestSpecHelper
  # make it easier to test JSON responses with helper.
  def json
    JSON.parse(response.body)
  end
end
