require('minitest/autorun')
require('minitest/reporters')
#require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../room')
require_relative('../guest')


class TestSong < Minitest::Test
  def setup

  end


end
