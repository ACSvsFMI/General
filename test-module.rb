require "net/http"
require "uri"

module TestModule

    # Params:
    # key = Google API Key
    def self.addTest(key,lat,lng,name)
        uri = URI.parse("https://maps.googleapis.com/maps/api/place/add/json?sensor=false&key=#{key}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE        
        request = Net::HTTP::Post.new(uri.request_uri)
        request.body="{\"location\": {\"lat\": #{lat},\"lng\": #{lng}},\"accuracy\": 50,\"name\":\"#{name}\", \"types\":[\"accounting\"],\"language\":\"en-AU\"}"
        response = http.request(request)
        response.body
    end
    
                                
    def self.delTest(key,ref) #ref = is a reference value returned by search or add

        uri = URI.parse("https://maps.googleapis.com/maps/api/place/delete/json?sensor=false&key=#{key}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE        
        request = Net::HTTP::Post.new(uri.request_uri)
        request.body="{\"reference\" : \"#{ref}\"}"
        response = http.request(request)
        response.body
    end    
    
    def self.searchTest(key,lat,lng,rad, search_string)
        uri = URI.parse("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&radius=#{rad}&name=#{search_string}&sensor=false&key=#{key}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE        
        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)
        response.body
    end     
end

#Run example
#key='put your own key here'
#TestModule::addTest(key,44.454369,26.099288,"HACK REQ /30")
#TestModule::addTest(key,44.464369,26.089288,"HACK REQ /27")
#TestModule::addTest(key,44.466369,26.086288,"HACK REQ /29")
#TestModule::addTest(key,44.468369,26.092288,"HACK REQ /29")
#TestModule::searchTest(key,44.454369,26.099288,10000, "HACK")


