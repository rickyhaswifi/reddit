class SubsController < ApplicationController

  # @model_names = Model_name.all
  # gets all records and sets to variable

  # show action - see a single records, id
  # @model_name = Model_name.find(params[:id])

  # new action - display the new records form, create the record in memory
  # @model_name = Model_name.new 

   # edit action - display the edit record form, id
  # @model_name = Model_name.find(params[:id])


  ###########################################
  # Create / Post
  # - create a record from the new action
  # @model_name = Model_name.new(model_name_params)

    # if @model_name.save
    #   do something
    # else
    #   render :new
    # end

  ###########################################
  #update / put patch
  # update actiom, edit a record, edit form, id
  # @model_name = Model_name.find(params[:id])
        # if @model_name.update(model_name_params)
        #   do something
        # else
        #   render :edit
        # end

###########################################
# destroy action - delete a record, id

# Model_name.find(params[:id]).destroy
# do something

###########################################
# model_name_params
# - pass certain attr
# private
# def model_name_params
#   params.require(:model_name).permite(:attr, :everything :that :table :has)
# end

# before_action :method_to_call, only: [:index, :show, :new]
        
  def index
    @subs = Sub.all
  end

  def show
   @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new 
    render partial: 'form'
  end

    def create 
      @sub = Sub.new(sub_params)
      if @sub.save
        redirect_to subs_path 
      else
        render :new
      end
    end

  def edit
    @sub = Sub.find(params[:id])
    render partial: 'form'
  end

  def update
     @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
          redirect_to subs_path
        else
          render :edit
        end
  end

  def destroy
    Sub.find(params[:id]).destroy
    redirect_to subs_path
  end

  private
  def sub_params
    params.require(:sub).permit(:attr, :name)
  end

  # def set_sub
  #   @sub = Sub.find(params[:id])
  # end

end
