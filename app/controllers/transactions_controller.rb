class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  before_action :ensure_current_user_is_author, only: [ :edit, :update, :destroy ]

  # GET /transactions or /transactions.json
  def index
      @transactions = Transaction.all

      @pagy, @transactions_pagy = pagy(Transaction.where(owner_id: current_user.id).order('date DESC'), items: 5)

  end

  # GET /transactions/1 or /transactions/1.json
  def show
    authorize @transaction
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
        # format.js { flash.now[:notice] = @transaction.errors.full_messages }
        format.js { flash.now[:notice] = @transaction.errors.full_messages }


      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
        format.js { flash.now[:notice] = @transaction.errors.full_messages }

      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    
    respond_to do |format|
      if @transaction.update(transaction_params)
        
        format.html { redirect_to @transaction, notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:date, :amount, :category, :receipt, :owner_id)
    end

    def ensure_current_user_is_author
      if current_user != @transaction.owner
        redirect_back fallback_location: root_url, notice: "You are not authorized to do this."
      end
    end

    
end
