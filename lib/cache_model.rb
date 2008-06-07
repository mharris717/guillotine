
require "rubygems"
require "activerecord"
require File.dirname(__FILE__) + "/cache_model/cached_model"
require File.dirname(__FILE__) + "/cache_model/converters"
require File.dirname(__FILE__) + "/cache_model/active_record"


require File.dirname(__FILE__) + "/cache_model/sql_parser/keyword_uppercaser"
require File.dirname(__FILE__) + "/cache_model/expression"
require "treetop"
require File.dirname(__FILE__) + "/cache_model/treetop/backtick_string"
Treetop.load File.dirname(__FILE__) + "/cache_model/treetop/sql_select"
