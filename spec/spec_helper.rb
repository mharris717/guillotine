require "spec"
require File.dirname(__FILE__) + "/../lib/guillotine"

module ParserSpecHelper
  def pre_parse(string, upcasing = false)
    Guillotine::PreParser.parse(string, upcasing)
  end
  
  def parse(string, upcasing = false)
    if pre_parsed_string = pre_parse(string, upcasing)
      @parser.parse(pre_parsed_string)
    else
      raise "* Could not pre-parse string! '#{string}'"
    end
  end
  
  def parse_and_eval(string, *eval_args)
    parse(string).eval(*eval_args)
  end
  
  def parse_and_eval_with_upcasing(string, *eval_args)
    parse(string, true).eval(*eval_args)
  end
end

Spec::Runner.configure do |conf|
  conf.before(:each) do
    Guillotine::DataStore.__clear_all_tables!
  end
end
