require 'lib/common_thread/xml/xml_magic'

xml = <<XML
<project title="XML Magic">
  <description>Test description.</description>
  <contact type="Project Manager">Anthony</contact>
  <contact type="Worker Bee">Ben</contact>
  <contact type="Designer Bee">Jason</contact>
</project>
XML

project_info = CommonThread::XML::XmlMagic.new(xml)

puts project_info[:title]
puts project_info.description
for contact in project_info.contact
  puts "#{contact} the #{contact[:type]}"
end