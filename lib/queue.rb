module Tenderize        
  class Queue < Base
    base_uri "#{tender_api_url}/queues"
    
    root_node 'named_queues'
  end
end