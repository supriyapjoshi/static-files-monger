require 'spec_helper'
require 'mapper/component_mapper'

module StaticFileMonger
  module Mapper
    describe ComponentMapper do
      context "given there is component file and component mapping" do
        let (:component_json) do
          {
            description: "Description for the component",
            custodians: "Custodian list",
            label: "Component Name",
            git_path: "my_path",
            class: "app",
            business_processes_involved: "component creation"
          }.to_json
        let (:component_mapping) do
          {"identity"=>{"name"=>"label", "connected"=>"business_processes_involved"}}
        end
        let (:mapped_component) do
          {
            type: "identity",
            name: "Component Name",
            description: "Description for the component",
            custodians: "Custodian list",
            git_path: "my_path",
            class: "app",
            connected: ["component creation"]
          }
        end
        it "does the mapping for the component" do
          expect(subject.map(component_json).with(component_mapping)).should eql(mapped_component)
        end
      end
    end
    end
  end
end



