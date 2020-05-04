Deface::Override.new(
  virtual_path: 'spree/admin/payments/_list',
  name: 'add_payment_reference_details',
  insert_after: "#payments",
  text: %q{
    <% if bank_transfer_payment = @order.payments.from_bank_transfer.first %>
      <fieldset class="no-border-bottom" >
        <legend align="center"><%= Spree.t(:payment_reference_details) %></legend>
        <table class="index">
          <thead>
            <tr data-hook="payments_header">
              <th><%= Spree.t(:deposited_on) %></th>
              <th><%= Spree.t(:bank_name) %></th>
              <th><%= Spree.t(:account_no) %></th>
              <th><%= Spree.t(:transaction_reference_no) %></th>
              <th class="actions"></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class='align-center'><%= bank_transfer_payment.deposited_on %></td>
              <td class='align-center'><%= bank_transfer_payment.bank_name %></td>
              <td class='align-center'><%= bank_transfer_payment.account_no %></td>
              <td class='align-center'><%= bank_transfer_payment.transaction_reference_no %></td>
            </tr>
          </tbody>
        </table>
      </fieldset>
    <% end %>

    <% if bank_transfer_payment = @order.payments.from_bank_transfer.first %>
      <% unless bank_transfer_payment.details_submitted? %>
        <br>
        <%= link_to Spree.t(:add_details), "javascript:void(0);", class: 'button add_bt_details' %>
      <% end %>
      <%= form_for bank_transfer_payment, html: { class: "bt_payment_form", style: "#{bank_transfer_payment.details_submitted? ? '' : 'display:none;'}" } do |f| %>
        <div class="form-group">
          <%= f.label Spree.t(:deposited_on) %>
          <%= f.text_field :deposited_on, disabled: bank_transfer_payment.details_submitted?, class: 'required_field form-control', 'field-name' => 'Deposited on' %>
        </div>

        <div class="form-group">
          <%= f.label Spree.t(:bank_name) %>
          <%= f.select :bank_name, options_for_select(Spree::Bank.all.map { |x| [x.name, x.id] }) disabled: bank_transfer_payment.details_submitted?, class: 'required_field form-control', 'field-name' => 'Bank name' %>
        </div>

        <div class="form-group">
          <%= f.label Spree.t(:account_no) %>
          <%= f.text_field :account_no, disabled: bank_transfer_payment.details_submitted?, class: 'required_field form-control', 'field-name' => 'Account No.' %>
        </div>

        <div class="form-group">
          <%= f.label Spree.t(:transaction_reference_no) %>
          <%= f.text_field :transaction_reference_no, disabled: bank_transfer_payment.details_submitted?, class: 'required_field form-control', 'field-name' => 'Transaction Reference No.' %>
        </div>

        <div class="form-group">
          <%= f.label Spree.t(:receipt) %>
          <%= f.text_field :receipt, disabled: bank_transfer_payment.details_submitted?, class: 'required_field form-control', 'field-name' => 'Receipt' %>
        </div>

        <% unless bank_transfer_payment.details_submitted? %>
          <%= f.submit "Submit", confirm: Spree.t(:confirm_details_submit), class: "btn btn-success btn-block" %>
        <% end %>
      <% end %>
    <% end %>
  }
)
