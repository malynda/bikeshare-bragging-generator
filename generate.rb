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
safe_list = [".", "..", "generate.rb", "template", "README.md"]

# Clear out existing generated files
Dir.foreach(Dir.pwd) do |entry|
   unless safe_list.include? entry
     FileUtils.rm_r(entry)
   end 
end

manifest = File.read("template/manifest_template.json")
  .gsub("#NAME#", name)
  .gsub("#VERSION#", version)
  .gsub("#URL#", url)

Dir.mkdir(name)
FileUtils.cp [
  "template/star_icon_white.png", 
  "template/twitter_logo_white.png", 
  "template/jquery.js", 
  "template/jquery.livequery.js", 
  "template/highcharts.js", 
  "template/icon48.png", 
  "template/icon128.png", 
  "template/ajax-loader.gif"
], name
Dir.chdir(name)
File.open("manifest.json", "w") { |f| f.write(manifest) }
puts "Extension generated."