require 'json'

filename = ARGV[0] 

if filename == nil 
  puts "usage:\t\t convert.rb <name of file to convert>"
  puts "example:\t convert.rb seZipCodes.json"
else 
  converted_array = Array.new
  
  zip_codes_json = JSON.parse(File.read(filename))
  zip_code_results = zip_codes_json["results"]
  zip_code_results.each do | zip_code |
    address = zip_code["address"].split(',').first
    converted_element = { :zip => zip_code["zipcode"], :name => address}
    converted_array << converted_element
  end
  output_file = File.open("seZipCodes.json", "w")
  output_file.write(JSON.pretty_generate(converted_array))
  output_file.close
  
  puts "🎉 done 🎉"
end

