Spree::Payment.class_eval do
  attr_accessor :validate_bank_details

  has_one_attached :receipt
  validates :bank_name, :deposited_on, :receipt, presence: true, if: :validate_bank_details

  scope :from_bank_transfer, -> { joins(:payment_method).where(spree_payment_methods: { type: 'Spree::PaymentMethod::BankTransfer' }) }

  self.whitelisted_ransackable_attributes = %w( bank_name state )

  def details_submitted?
    bank_name?
  end
end
