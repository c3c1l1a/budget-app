class DetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_detail, only: [:show, :edit, :update, :destroy]

  # GET expenses/1/details
  def index
    @details = Detail.all
  end

  # GET expenses/1/details/1
  def show
  end

  # GET expenses/1/details/new
  def new
    @detail = Detail.new
    
  end

  # GET expenses/1/details/1/edit
  def edit
  end

  # POST expenses/1/details
  def create
    @detail = Detail.new(detail_params)
  
    # @detail = @expense.details.build(detail_params)

    respond_to do |format|
      if @detail.save
        format.html { redirect_to(@detail.expense, notice: 'Detail was successfully created.')}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
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
    def set_detail
      @detail = Detail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def detail_params
      params.require(:detail).permit(:name, :amount, :expense_id)
    end
end
