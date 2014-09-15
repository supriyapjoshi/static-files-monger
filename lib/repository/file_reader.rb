module StaticFileMonger
  module Repository
    class FileReader
      def index
       component_files.map { |file| id_for_file file}
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

