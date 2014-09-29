puts "Name of the bikeshare bragging extension:"
puts '(i.e. "DivvyBrags")'
name = gets.chomp
puts "Got it, extension's name is #{name}."
puts "Version of the manifest: (i.e. 2.3.3)"
version = gets.chomp
puts "Got it, the version is #{version}."
puts "What's the url?"
puts '(format: https://www.divvybikes.com)'
url = gets.chomp
puts "Got it, the URL is #{url}."

require 'fileutils'
safe_list = [".", "..", "generate.rb", "manifest_template.json", "README.md"]

# Clear out existing generated files
Dir.foreach(Dir.pwd) do |entry|
   unless safe_list.include? entry
     FileUtils.rm_r(entry)
   end 
end

manifest = File.read("manifest_template.json")
  .gsub("#NAME#", name)
  .gsub("#VERSION#", version)
  .gsub("#URL#", url)

Dir.mkdir(name)
Dir.chdir(name)
File.open("manifest.json", "w") { |f| f.write(manifest) }
puts "manifest.json file generated."