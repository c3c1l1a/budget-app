class DetailsController < ApplicationController
  before_action :set_expense
  before_action :set_detail, only: [:show, :edit, :update, :destroy]

  # GET expenses/1/details
  def index
    @details = @expense.details
  end

  # GET expenses/1/details/1
  def show
  end

  # GET expenses/1/details/new
  def new
    @detail = @expense.details.build
  end

  # GET expenses/1/details/1/edit
  def edit
  end

  # POST expenses/1/details
  def create
    @detail = @expense.details.build(detail_params)

    if @detail.save
      redirect_to([@detail.expense, @detail], notice: 'Detail was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT expenses/1/details/1
  def update
    if @detail.update_attributes(detail_params)
      redirect_to([@detail.expense, @detail], notice: 'Detail was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE expenses/1/details/1
  def destroy
    @detail.destroy

    redirect_to expense_details_url(@expense)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:expense_id])

    end

    def set_detail
      @detail = @expense.details.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def detail_params
      params.require(:detail).permit(:name, :amount, :expense_id)
    end
end
