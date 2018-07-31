require_relative '../config/environment.rb'

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
find_title(get_book_from_user)
