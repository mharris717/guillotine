require File.dirname(__FILE__) + "/../../spec_helper"

describe "Datastore / Create table Integration" do
  it "should create the table in the datastore" do
    Guillotine.parse("CREATE TABLE foo (id INT (11))").call
    Guillotine::DataStore.table_names.should include(:foo)
  end
end