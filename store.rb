require 'json'

class StorageProcedures
  def write_to_storage(data)
    storage_units = ['rentals.json', 'books.json', 'people.json']
    data.each_with_index do |single_array, i|
      next if single_array.empty?

      File.exist?("data/#{storage_units[i]}") ? File.read("data/#{storage_units[i]}") : []

      single_array_hashes = single_array.map do |item|
        if item.respond_to?(:to_h_without_related)
          item.to_h_without_related
        else
          item.to_h
        end
      end

      File.open("data/#{storage_units[i]}", 'w') do |file|
        file.puts JSON.pretty_generate(single_array_hashes)
      end
    end
    puts 'Data stored successfully'
  end
end
