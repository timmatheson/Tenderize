require File.dirname(__FILE__) + '/spec_helper'

describe Tenderize::Faq do  
  context "as a class" do
    it "should respond to all" do
      Tenderize::Faq.respond_to?(:all).should be_true
    end
    
    it "should respond to find" do
      Tenderize::Faq.respond_to?(:find).should be_true
    end
  end
end