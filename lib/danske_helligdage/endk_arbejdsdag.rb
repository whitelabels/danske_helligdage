# -*- coding: utf-8 -*-

require 'danske_helligdage'

module DanskeHelligdage
  module EndkArbejdsdag

    # Calculate the following working day taking into account special Energinet.dk holidays.
    #
    # ==== Parameters
    # [<tt>num</tt>]  Integer. Number of banking days forward (>0) or backwards (<0). 0 = return this date if it is a
    #                          working day otherwise return the following working day (endk_arbjedsdag(1))
    #
    # Returns Date of the next/previous Energinet.dk working day.
    #
    # Note: returns a new Date object and does not change current object.
    def endk_arbejdsdag(num=1)
      if num == 0
        return endk_arbejdsdag? ? self : endk_arbejdsdag(1)
      end
      step_direction = (num > 0) ? 1 : -1
      d = self+step_direction
      until (d.endk_arbejdsdag?) do
        d = d+step_direction
      end

      # recursively find next/previous banking day(s)
      num.abs > 1 ? d.endk_arbejdsdag(num-step_direction) : d
    end

  end
end

Date.send(:include, DanskeHelligdage::EndkArbejdsdag)
