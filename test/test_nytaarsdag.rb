require 'test/unit'
require 'danske_helligdage'

class NytaarsdagTests < Test::Unit::TestCase

  def setup
    require 'danske_helligdage/nytaarsaftensdag'
  end

  def teardown
    # Restore the original Date class
    Date.send(:include, DanskeHelligdage::Officielle)
  end

  def test_should_return_the_name_of_the_holiday
    assert_equal 'Nytårsdag', Date.civil(2015, 1, 1).helligdag
  end

end
