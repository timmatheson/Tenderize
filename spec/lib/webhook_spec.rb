require File.dirname(__FILE__) + '/spec_helper'

describe Tenderize::Webhook do  
  context "as a class" do
    it "should respond to all" do
      Tenderize::Webhook.respond_to?(:all).should be_true
    end
    
    it "should respond to find" do
      Tenderize::Webhook.respond_to?(:find).should be_true
    end
  end
end