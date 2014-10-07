# -*- coding: utf-8 -*-

require 'danske_helligdage'

module DanskeHelligdage
  module Arbejdsdag

    # Calculate the following working day.
    #
    # ==== Parameters
    # [<tt>num</tt>]  Integer. Number of working days forward (>0) or backwards (<0). 0 = return this date if it is a
    #                          arbejdsdag otherwise return the following arbejdsdag (arbejdsdag(1))
    #
    # Returns Date of the next/previous working day.
    #
    # Note: returns a new Date object and does not change current object.
    def arbejdsdag(num=1)
      if num == 0
        return arbejdsdag?? self : arbejdsdag(1)
      end

      step_direction = (num > 0) ? 1 : -1
      d = self+step_direction
      until(d.arbejdsdag?) do
        d = d+step_direction
      end

      # recursively find next/previous working day(s)
      num.abs > 1 ? d.arbejdsdag(num-step_direction ) : d
    end

  end
end

Date.send(:include, DanskeHelligdage::Arbejdsdag)
