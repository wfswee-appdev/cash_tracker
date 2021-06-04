I am trying to provide the user with a helpful alert when creating a record where the record is inserted using ajax. The user is performing this action in /views/transactions/index.html.erb.

My database contains a field with a not null validation:

  t.decimal :amount, null: false

My approach is laid out below, but it fails. No error messages are displayed when the user submits the form with the amount field empty; instead, nothing happens on the page. The message in the javascript console points out:

ActiveRecord::NotNullViolation at /transactions

but I don't see anything more helpful than that in it.

1. In my transactions_controller, I capture the error messages:

**/controllers/transactions_controller.rb**
def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
        format.js { flash.now[:notice] = @transaction.errors.full_messages }


      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
        format.js { flash.now[:notice] = @transaction.errors.full_messages }

      end
    end
  end

2. My create create javascript inserts the code to render partial that displays the errors and attaches it to a div with id "flash":

**/views/transactions/create.js.erb**
var added_transaction = $("<%= j(render @transaction) %>");

$("#transaction_list").prepend(added_transaction);

$("#flash").html('<%= j render partial: "shared/notice_banner" %>');

3. My application layout contains the div with id "flash":

**/views/layouts/application.html.erb**
<div id="flash">
  <% if notice.present? %>
    <%= render partial: "shared/notice_banner" %>
  <% end %>
</div>

4. Here is the partial that should show the errors to the user:

**/views/shared/_notice_banner.html.erb**
<div class="alert alert-<%= css_class %> alert-dismissible fade show" role="alert">
  <%= notice %>

  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">x</span>
  </button>
</div>

