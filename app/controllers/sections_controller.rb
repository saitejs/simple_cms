class SectionsController < ApplicationController
  layout "admin"
before_action :confirm_logged_in
  def index

@sections= Section.sorted
  end

  def show
@section = Section.find(params[:id])

  end

  def new
    
    @section =Section.new({:name => "Default"})
 @pages = Section.order('position ASC')
  @section_count = Section.count+1

  end


  def create

  @section = Section.new(section_params)
  if @section.save

    flash[:notice]= "new section is created"
    redirect_to(:action => "index")

  else
    @pages = Section.order('position ASC')
  @section_count = Section.count+1
    render("new")
  end
    
  end

  def edit

    @section = Section.find(params[:id])
    @pages = Section.order('position ASC')
  @section_count = Section.count

  end

def update
    @section = Section.find(params[:id])

    if @section.update_attributes(section_params)
      flash[:notice] = "section is successfully updated"
      redirect_to(:action => "show" ,:id => @section.id)

    else

      @pages = Section.order('position ASC')
  @section_count = Section.count
      render("new")
    end
end

  def delete
   @section = Section.find(params[:id])

  end

  def destroy
    @section = Section.find(params[:id]).destroy
    flash[:notice] = "section is deleted successfuly "
    redirect_to(:action => "index")

    
  end

  private

  def section_params
     params.require(:section).permit(:page_id,:name,:position,:visible,:content_type,:content)
    
  end
end
