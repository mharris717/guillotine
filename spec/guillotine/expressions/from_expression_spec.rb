require File.dirname(__FILE__) + "/../../spec_helper"

module Guillotine
  module Expressions
    describe From do
      describe "to_sql" do
        it "should return 'FROM a_table'" do
          From.new(:foo).to_sql.should == "FROM foo"
        end
        
        it "should use the proper table name" do
          From.new(:bar).to_sql.should == "FROM bar"
        end
        
        it "should join two table names with a ','" do
          From.new(:foo, :bar).to_sql.should == "FROM foo, bar"
        end
      end
      
      describe "table_name" do
        it "should have the table name as the first table (FIXME)" do
          From.new(:foo, :bar).table_name.should equal(:foo)
        end
      end
    end
  end
end
