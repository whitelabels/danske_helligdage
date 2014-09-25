# -*- coding: utf-8 -*-

require 'danske_helligdage'

module DanskeHelligdage
  module Bankdag

    # Calculate the following banking day.
    #
    # ==== Parameters
    # [<tt>num</tt>]  Integer. Number of banking days forward (>0) or backwards (<0).
    #
    # Returns Date of the next/previous banking day.
    #
    # Note: returns a new Date object and does not change current object.
    def bankdag(num=1)
      step_direction = (num > 0) ? 1 : -1
      d = self+step_direction
      until(d.bankdag?) do
        d = d+step_direction
      end

      # recursively find next/previous banking day(s)
      num.abs > 1 ? d.bankdag(num-step_direction ) : d
    end

  end
end

Date.send(:include, DanskeHelligdage::Bankdag)
