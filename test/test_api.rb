require 'test/unit'
require 'EventbriteClient'

class TestApi < Test::Unit::TestCase
    def setup
        @eb = EventbriteClient::API.new(:app_key => "IT7XL4RVM2CGSGTVLX")
    end
    def test_event_search
        events = @eb.event_search({})
        assert events.count > 0, "No events were returned"
    end
end
