require "alfabank/version"
require "alfabank/currency"
require "alfabank/api"
require "alfabank/configuration"

module Alfabank
  def register(use_binding: false)
    Api::Registration.new(self).process(use_binding: use_binding)
  end

  def check_status(use_binding: false)
    Api::Status.new(self).process(use_binding: use_binding)
  end

  def payment_order_binding(binding_id)
    Api::PaymentOrderBinding.new(self).process(binding_id)
  end

  class << self
    attr_accessor :logger

    def setup(&block)
      yield Configuration
    end
  end
end
