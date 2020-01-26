require('minitest/autorun')
require('minitest/reporters')
#require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative( '../room' )
require_relative('../guest')
require_relative('../building')
require_relative('../drink')




class TestDrink < Minitest::Test

end
