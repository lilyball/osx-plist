require "#{File.dirname(__FILE__)}/plist/ext/plist"

module OSX
  module PropertyList
    # Loads a property list from the file at +filepath+ using OSX::PropertyList.load.
    def self.load_file(filepath, format = false)
      File.open(filepath, "r") do |f|
        OSX::PropertyList.load(f, format)
      end
    end
    # Writes the property list representation of +obj+ to the file at +filepath+ using OSX::PropertyList.dump.
    def self.dump_file(filepath, obj, format = :xml1)
      File.open(filepath, "w") do |f|
        OSX::PropertyList.dump(f, obj, format)
      end
    end
  end
end
