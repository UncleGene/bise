require 'spec_helper'
#rubs
#ruby
#ruby's
#rubying
#rucksack

describe Bise do
  before(:all) do
    @dict = File.join(File.dirname(__FILE__), 'dict')
  end
            
  it 'should find first line for "small" term' do
    File.open(@dict){|f| f.bin_find('a')}.should == 'rubs'
    File.open(@dict){|f| f.bin_find('A'){|t,s| t.downcase <=> s}}.should == 'rubs'
  end
  
  it 'should find full word for starting part' do
    File.open(@dict){|f| f.bin_find('rubyi')}.should == 'rubying'
    File.open(@dict){|f| f.bin_find('RuByI'){|t,s| t.downcase <=> s}}.should == 'rubying'
  end

  it 'should find exact word' do
    File.open(@dict){|f| f.bin_find('ruby')}.should == 'ruby'
    File.open(@dict){|f| f.bin_find('rUbY'){|t,s| t.downcase <=> s}}.should == 'ruby'
  end

  it 'should find nothing for "big" term' do
    File.open(@dict){|f| f.bin_find('z')}.should == nil
    File.open(@dict){|f| f.bin_find('Z'){|t,s| t.downcase <=> s}}.should == nil
  end
  

end
