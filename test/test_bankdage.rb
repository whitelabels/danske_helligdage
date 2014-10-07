# -*- coding: UTF-8 -*-
require 'test/unit'
require 'danske_helligdage'
require 'danske_helligdage/bankdag'

class BankdageTests < Test::Unit::TestCase

  def test_should_return_next_bank_day
    assert_equal Date.civil(2008, 5, 6), Date.civil(2008, 5, 5).bankdag
  end

  def test_should_return_next_banking_day_on_a_sunday
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 5, 4).bankdag
  end

  def test_should_return_next_banking_day_on_a_saturday
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 5, 3).bankdag
  end

  def test_should_return_next_banking_day_on_a_friday
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 5, 2).bankdag
  end

  def test_should_return_next_banking_day_on_a_holiday
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 5, 1).bankdag
  end

  def test_should_return_next_banking_day_before_a_holiday
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 4, 30).bankdag
  end

  def test_should_return_next_3_banking_day_before_holiday_and_weekend
    assert_equal Date.civil(2008, 5, 7), Date.civil(2008, 4, 30).bankdag(3)
  end

  def test_should_return_previous_banking_day
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 5, 6).bankdag(-1)
  end

  def test_should_return_previous_banking_day_on_a_monday
    assert_equal Date.civil(2008, 4, 30), Date.civil(2008, 5, 5).bankdag(-1)
  end

  def test_should_return_previous_banking_day_on_a_holiday
    assert_equal Date.civil(2008, 4, 30), Date.civil(2008, 5, 2).bankdag(-1)
  end

  def test_should_return_previous_3_banking_day_before_holiday_and_weekend
    assert_equal Date.civil(2008, 4, 29), Date.civil(2008, 5, 6).bankdag(-3)
  end

  def test_should_return_the_day_it_self_if_it_is_bank_day
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 5, 5).bankdag(0)
  end

  def test_should_return_the_next_bank_day_if_it_is__not_a_bank_day
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 5, 4).bankdag(0)
  end

  # April 29 Tuesday Bank day
  # April 30 Wednesday Bank day
  # May    1 Thursday Accension Holiday
  # May    2 Friday Friday after accension Workday but not Bankday
  # May    3 Saturday Weekend
  # May    4 Sunday Weekend
  # May    5 Monday bank and work day
  # May    6 Tuesday bank and work day
  # May    7 Wednesday bank and work day
end
