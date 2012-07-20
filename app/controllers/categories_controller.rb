class CategoriesController < ApplicationController


before_filter :get_category_object, :only =>[:edit, :update, :destroy]

private

def get_category_object
    @category=Category.find_by_id(params[:id])
    if @category.nil?
    flash[:notice]="sorry,no category was found!"
    redirect_to categories_path
    end
end

public 


def index

@categories = Category.all
 # render:text=>"hai"
end

def edit
 # @post=Post.find(params[:id])
end

def update
  
  if @category.update_attributes(params[:category])
  flash[:notice]="category has been updated"
  redirect_to categories_path
  else
  render :action =>:edit
  end
end



def new
@category =Category.new
end

def create
@category=Category.new(params[:category])
if @category.save
flash[:notice]="saved"
redirect_to categories_path
else
render :action =>:new
end
end

def destroy

@category.destroy
if @category == Category.default
flash[:error] = "sorry, you can not delete the default category"
  redirect_to categories_path and return
 end
 @category.destroy
flash[:notice]="category has successfully deleted"
redirect_to categories_path
end

end
