require 'json'

class StorageProcedures
  def write_to_storage(data)
    storage_units = ['rentals.json', 'books.json', 'people.json']
    data.each_with_index do |single_array, i|
      stored_data = File.exist?("data/#{storage_units[i]}") ? File.read("data/#{storage_units[i]}") : []

      #stored_data.empty? ? [] : JSON.parse(stored_data)

      single_array_hashes = single_array.map(&:to_h) || single_array.map(&:to_h_without_related)

      File.open("data/#{storage_units[i]}", 'w') do |file|
        file.puts JSON.pretty_generate(single_array_hashes)
      end
    end
    puts 'Data stored successfully'
  end
end
