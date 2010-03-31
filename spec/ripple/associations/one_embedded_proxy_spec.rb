# Copyright 2010 Sean Cribbs, Sonian Inc., and Basho Technologies, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
require File.expand_path("../../../spec_helper", __FILE__)

describe Ripple::Document::Associations::OneEmbeddedProxy do
  before :all do
    Object.module_eval do
      class Parent
        include Ripple::Document
        one :child
      end
      
      class Child
        include Ripple::EmbeddedDocument
      end
    end
  end
  
  before :each do
    @parent = Parent.new
    @child  = Child.new
    @parent.stub!(:save).and_return(true)
  end
  
  it "should not have a child before one is set" do
    @parent.child.should be_nil
  end
  
  it "should be able to set its child" do
    @parent.child = @child
    @parent.child.should == @child
  end
  
  after :all do
    Object.send(:remove_const, :Parent)
    Object.send(:remove_const, :Child)
  end
end