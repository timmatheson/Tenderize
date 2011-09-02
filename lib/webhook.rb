module Tenderize
  class Webhook < Base
    base_uri "#{tender_api_url}/webhooks"
  end
end