require 'spec_helper'
require 'static_file_monger/repository/file_reader'
require 'active_support/core_ext'

module StaticFileMonger
  module Repository
    describe FileReader do
      context "given there are a set of component files" do
        let(:first_component_json) do
          {
            label: "First"
          }.to_json
        end

        let(:second_component_json) do
          {
            label: "Second"

          }.to_json
        end
        before do
         expect(Dir).to receive(:glob).with('data/components/*.json').and_return(['data/components/first.json', 'data/components/second.json'])
         #expect(IO).to receive(:read).with('data/components/second.json').and_return second_component_json
        end
        it 'reads the index of component ids' do
          expect(subject.index).to eql(['first','second'])
        end
        it 'gossips about the component' do
         expect(IO).to receive(:read).with('data/components/first.json').and_return first_component_json
          expect(subject.gossip_about_component('first')).not_to be_empty
        end

      end
    end
  end

  end

