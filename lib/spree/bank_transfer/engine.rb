module Spree
  module BankTransfer
    class Engine < Rails::Engine
      engine_name 'spree-bank-transfer'

      isolate_namespace Spree::BankTransfer

      initializer "spree.spree-bank-transfer.payment_methods", :after => "spree.register.payment_methods" do |app|
        app.config.spree.payment_methods << Spree::Gateway::BankTransfer
      end
    end
  end
end
