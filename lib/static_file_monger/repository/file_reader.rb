module StaticFileMonger
  module Repository
    class FileReader
      def index
       component_files.map { |file| id_for_file file}
      end

      def gossip_about_component(component_name)
        JSON.load(IO.read(component_files.select{|file| file.include? "#{component_name}.json"}.first))
      end
      def component_files
        Dir.glob('data/components/*.json')
      end

      def id_for_file file
        File.basename(file, ".json")
      end
    end
  end
end

