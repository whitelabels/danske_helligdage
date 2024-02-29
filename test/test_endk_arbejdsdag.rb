# -*- coding: UTF-8 -*-
require 'test/unit'
require 'danske_helligdage'
require 'danske_helligdage/endk_arbejdsdag'

class EndkArbejdsdagTests < Test::Unit::TestCase

  def test_should_return_next_endk_work_day
    assert_equal Date.civil(2008, 5, 6), Date.civil(2008, 5, 5).endk_arbejdsdag
  end

  def test_should_return_next_endk_work_day_on_a_sunday
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 5, 4).endk_arbejdsdag
  end

  def test_should_return_next_endk_work_day_on_day_that_used_to_be_st_bededag
    assert_equal Date.civil(2024, 4, 26), Date.civil(2024, 4, 25).endk_arbejdsdag
  end

  def test_should_return_next_endk_work_day_on_a_saturday
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 5, 3).endk_arbejdsdag
  end

  def test_should_return_next_endk_work_day_on_a_friday
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 5, 2).endk_arbejdsdag
  end

  def test_should_return_next_endk_work_day_on_a_holiday
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 5, 1).endk_arbejdsdag
  end

  def test_should_return_next_endk_work_day_before_a_holiday
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 4, 30).endk_arbejdsdag
  end

  def test_should_return_next_3_endk_work_day_before_holiday_and_weekend
    assert_equal Date.civil(2008, 5, 7), Date.civil(2008, 4, 30).endk_arbejdsdag(3)
  end

  def test_should_return_previous_endk_work_day
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 5, 6).endk_arbejdsdag(-1)
  end

  def test_should_return_previous_endk_work_day_on_a_monday
    assert_equal Date.civil(2008, 4, 30), Date.civil(2008, 5, 5).endk_arbejdsdag(-1)
  end

  def test_should_return_previous_endk_work_day_on_a_holiday
    assert_equal Date.civil(2008, 4, 30), Date.civil(2008, 5, 2).endk_arbejdsdag(-1)
  end

  def test_should_return_previous_3_endk_work_day_before_holiday_and_weekend
    assert_equal Date.civil(2008, 4, 29), Date.civil(2008, 5, 6).endk_arbejdsdag(-3)
  end

  def test_should_return_the_day_itself_if_it_is_endk_work_day
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 5, 5).endk_arbejdsdag(0)
  end

  def test_should_return_the_next_endk_work_day_if_it_is_not_a_endk_work_day
    assert_equal Date.civil(2008, 5, 5), Date.civil(2008, 5, 4).endk_arbejdsdag(0)
  end

  # 27.12.2013 - Friday: It is not a ENDK Work day, 28.12 and 29.12 are weekend, so the first ENDK Work day after will be 30.12
  def test_should_skip_third_christmas_day
    assert_equal Date.civil(2013, 12, 30), Date.civil(2013, 12, 23).endk_arbejdsdag(1)
  end

  # April 29 Tuesday ENDK Work day
  # April 30 Wednesday ENDK Work day
  # May    1 Thursday Accension Holiday
  # May    2 Friday Friday after accension Workday but not ENDK Work day
  # May    3 Saturday Weekend
  # May    4 Sunday Weekend
  # May    5 Monday ENDK Work and regular work day
  # May    6 Tuesday ENDK Work and regular work day
  # May    7 Wednesday ENDK Work and regular day
end
