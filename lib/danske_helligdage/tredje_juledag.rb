# encoding: UTF-8
require 'danske_helligdage'

module DanskeHelligdage
  module Tredjejuledag

    def self.included(base)
      base.class_eval do
        alias_method :helligdag_without_tredjejuledag, :helligdag
        alias_method :helligdag, :helligdag_with_tredjejuledag
      end
    end

    def helligdag_with_tredjejuledag
      (month == 12 && day == 27) ? 'Tredje Juledag' : helligdag_without_tredjejuledag
    end

  end
end

Date.send(:include, DanskeHelligdage::Tredjejuledag)
