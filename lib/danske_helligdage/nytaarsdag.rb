require 'danske_helligdage'

module DanskeHelligdage
  module Nytaarsdag

    def self.included(base)
      base.class_eval do
        alias_method :helligdag_without_nytaarsdag, :helligdag
        alias_method :helligdag, :helligdag_with_nytaarsdag
      end
    end

    def helligdag_with_nytaarsaften
      (month == 1 && day == 1) ? 'Nytårsdag' : helligdag_without_nytaarsdag
    end

  end
end

Date.send(:include, DanskeHelligdage::Nytaarsdag)
