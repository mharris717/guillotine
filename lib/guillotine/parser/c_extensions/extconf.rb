require 'mkmf'
QUOTES_PARSER = File.dirname(__FILE__) + '/c_quotes_parser'

dir_config(QUOTES_PARSER)
create_makefile(QUOTES_PARSER)
