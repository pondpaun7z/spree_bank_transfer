Deface::Override.new(
  virtual_path: 'spree/checkout/_payment',
  name: 'add_bank_transfer_instructions_link_to_payment',
  insert_after: "#payment-method-fields",
  partial: "spree/checkout/payment/banktransfer"
)
