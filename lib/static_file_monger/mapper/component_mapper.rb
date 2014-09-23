require 'yaml'
require 'json'

module StaticFileMonger
  module Mapper
    class ComponentMapper
      def initialize
        @component_map = YAML.load_file('mappers/components.yml')
      end
      def map(component_json)
        component_parsed = JSON.parse(component_json)
        rational_json = {"type"=>"identity","name"=>"#{component_parsed.delete(@component_map["identity"]["name"])}",
                         "connected"=>["#{component_parsed.delete(@component_map["identity"]["connected"])}"]}
        puts component_parsed
        rational_json.merge!(component_parsed).to_json

        #@component_map["identity"]
      end
    end
  end
end

