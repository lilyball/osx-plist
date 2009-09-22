require 'rubygems'
require 'osx/plist'
require 'stringio'
require 'tempfile'
require 'test/unit'

class TestPlist < Test::Unit::TestCase
  def test_string
    plist = OSX::PropertyList.load("{foo = bar; }")
    assert_equal( { "foo" => "bar" }, plist )

    plist, format = OSX::PropertyList.load("{foo = bar; }", true)
    assert_equal( { "foo" => "bar" }, plist )
    assert_equal( :openstep, format )
    
    # make sure sources < 6 characters work
    plist = OSX::PropertyList.load("foo")
    assert_equal( "foo", plist )
    
    # make sure it works with format too
    plist, format = OSX::PropertyList.load("foo", true)
    assert_equal( "foo", plist )
    assert_equal( :openstep, format )
    
    assert_raise(OSX::PropertyListError) { OSX::PropertyList.load("") }
  end

  def setup_hash
    time = Time.gm(2005, 4, 28, 6, 32, 56)
    random = "\x23\x45\x67\x89"
    random.blob = true
    {
      "string!" => "indeedy",
      "bar" => [ 1, 2, 3 ],
      "foo" => {
        "correct?" => true,
        "pi" => 3.14159265,
        "random" => random,
        "today" => time,
      }
    }
  end

  def test_io
    plist, format = OSX::PropertyList.load(File.read("#{File.dirname(__FILE__)}/fixtures/xml_plist"), true)

    hash = setup_hash

    assert_equal(hash, plist)
    assert_equal(true, plist['foo']['random'].blob?)
    assert_equal(false, plist['string!'].blob?)
    
    assert_equal(:xml1, format)
  end

  def test_dump
    str = StringIO.new("", "w")
    hash = setup_hash
    OSX::PropertyList.dump(str, hash)
    hash2 = OSX::PropertyList.load(str.string)
    assert_equal(hash, hash2)
  end

  def test_to_plist
    assert_raise(OSX::PropertyListError) { "foo".to_plist(:openstep) }
    assert_equal("foo", OSX::PropertyList.load("foo".to_plist))
    hash = setup_hash()
    assert_equal(hash, OSX::PropertyList.load(hash.to_plist))
  end

  def test_load_file
    plist, format = OSX::PropertyList.load_file("#{File.dirname(__FILE__)}/fixtures/xml_plist", true)

    hash = setup_hash

    assert_equal(hash, plist)
    assert_equal(:xml1, format)
  end

  def test_dump_file
    hash = setup_hash
    Tempfile.open("test_plist") do |temp|
      OSX::PropertyList.dump_file(temp.path, hash)
      hash2 = OSX::PropertyList.load_file(temp.path)
      assert_equal(hash, hash2)
    end
  end
end
