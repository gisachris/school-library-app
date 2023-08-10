require 'json'
require 'fileutils'

class StorageProcedures
  def write_to_storage(data)
    directory_path = 'data'
    FileUtils.mkdir_p(directory_path)

    storage_units = ['rentals.json', 'books.json', 'people.json']
    data.each_with_index do |single_array, i|
      next if single_array.empty?

      file_path = File.join(directory_path, storage_units[i])

      single_array_hashes = single_array.map do |item|
        if item.respond_to?(:to_h_without_related)
          item.to_h_without_related
        else
          item.to_h
        end
      end

      File.open(file_path, 'w') do |file|
        file.puts JSON.pretty_generate(single_array_hashes)
      end
    end
    puts 'Data stored successfully'
  end

  def read_from_storage
    data = []

    storage_units = ['rentals.json', 'books.json', 'people.json']
    directory_path = 'data'

    storage_units.each do |file_name|
      file_path = File.join(directory_path, file_name)

      if File.exist?(file_path)
        data_json = File.read(file_path)
        data << JSON.parse(data_json, symbolize_names: true)
      else
        data << []
      end
    end

    data
  end
end
