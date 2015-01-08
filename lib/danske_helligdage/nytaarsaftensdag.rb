# encoding: UTF-8
require 'danske_helligdage'

module DanskeHelligdage
  module Nytaarsaftensdag

    def self.included(base)
      base.class_eval do
        alias_method :helligdag_without_nytaarsaften, :helligdag
        alias_method :helligdag, :helligdag_with_nytaarsaften
      end
    end

    def helligdag_with_nytaarsaften
      (month == 12 && day == 31) ? 'Nytårsaftensdag' : helligdag_without_nytaarsaften
    end

  end
end

Date.send(:include, DanskeHelligdage::Nytaarsaftensdag)
