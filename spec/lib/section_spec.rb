require File.dirname(__FILE__) + '/spec_helper'

describe Tenderize::Section do  
  context "as a class" do
    it "should respond to all" do
      Tenderize::Section.respond_to?(:all).should be_true
    end
    
    it "should respond to find" do
      Tenderize::Section.respond_to?(:find).should be_true
    end
  end
end