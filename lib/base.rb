module Tenderize
  class Base
    include HTTParty
    
    @@response = {}
    
    def self.config_file_path
      File.dirname(__FILE__) + "/../config/tenderize.yml"
    end
    
    def self.config
      if File.exists? config_file_path
        @@config = YAML.load_file( config_file_path )
      else
        raise Exception, "Missing tenderize config file. The file should be found at #{config_file_path}."
      end
    end
    
    def self.tender_api_url
      "http://api.tenderapp.com/ordercup"
    end
    
    def self.root_node( node )
      @@root_node = node
    end
    
    base_uri tender_api_url

    headers  'Accept' => 'application/vnd.tender-v1+json'
    format   :json
    
    # Basic Auth Credentials
    basic_auth config.email, config.password
    
    def self.all
      @@response = parse( get('/').body )
      return @@response[ @@root_node ]
    end
    
    def self.find( resource_id )
      @@response = parse( get("/#{resource_id}").try(:body) )
      @@response[ @@root_node ]
    end
    
    def self.method_missing( method, *args )
      if @@response.has_key?( method )
        return @@response[ method ]
      else
        super
      end
    end
    
    private
    
    def self.parse( string )
      JSON.parse( string )
    end
  end
  
end