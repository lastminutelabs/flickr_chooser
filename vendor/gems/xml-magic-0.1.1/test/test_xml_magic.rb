require File.dirname(__FILE__) + '/test_helper.rb'

class TestXmlMagic < Test::Unit::TestCase

  def setup
  end
  
  def test_xml_magic
    x = CommonThread::XML::XmlMagic.new('<project title="Xml Magic" class="CommonThread::XML::XmlMagic"><media:content>This is the content.</media:content><type>New</type><contact name="Anthony">Anthony</contact><contact name="Ben">Ben</contact><contact name="Jason">Jason</contact><description>Test description.</description></project>')
    
    # Elements without namespaces
    assert_equal("Test description.", x.description.to_s, "Element text not retrieved for to_s.")
    assert_equal("AnthonyBenJason", x.contact.to_s, "Multiple element text not retrieved for to_s.")
    assert_equal(nil, x.note, "Element selector should return nil when there are no matches.")
    assert_equal("New", x.type.to_s, "Element names clash with inherited Object methods and properties")
    
    # Namespaced elements
    assert_equal(nil, x.content, "Namespaced elements should return nil when namespace is not provided.")
    x.namespace = "media"
    assert_equal("This is the content.", x.content.to_s, "Namespaced element selection is broken.")
    x.namespace = ""
    assert_equal(nil, x.content, "Namespace was not removed from selection.")    

    # Element attributes
    assert_equal("Xml Magic", x[:title], "Invalid attribute value.")
    assert_equal("CommonThread::XML::XmlMagic", x[:class], "Attribute names clash with inherited Object methods and properties")

    # Selector matches multiple elements
    assert_equal("Anthony", x.contact[0][:name], "Multiple elements not quacking like an Array.")
    x.contact.each do |contact|
      assert(contact[:name] != nil, "Attribute name should not be nil.")
      assert(contact[:phone] == nil, "Attribute phone should be nil.")
    end
    assert_equal(3, x.contact(:count), "Multiple element count is wrong.")    
  end
end
