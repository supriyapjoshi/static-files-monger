require 'spec_helper'
require 'static_file_monger/mapper/component_mapper'
require 'active_support/core_ext'

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
            business_processes_involved: ["component creation","component update"]
          }.to_json
        end
        let (:component_mapping) do
          {"identity"=>{"name"=>"label", "connected"=>{"business_processes_involved"=>"id"}}}
        end
        let (:mapped_component) do
          {
            type: "identity",
            name: "Component Name",
            connected: ["component creation", "component update"],
            description: "Description for the component",
            custodians: "Custodian list",
            git_path: "my_path",
            class: "app"
          }.to_json
        end
        it "does the mapping for the component" do
          expect(subject.map(component_json)).to eql(mapped_component)
        end
      end
    end
  end
end



