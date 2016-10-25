class PagesController < ApplicationController
  

  layout "admin"
before_action :confirm_logged_in
  def index
    @pages= Page.sorted
  end

  def show
    @page= Page.find(params[:id])
  end

  def new
    @subjects = Subject.order('position ASC')
  @page_count = Page.count+1

    @page =Page.new({:name => "Default"})
  end

  def create

    @page =Page.new(page_params)

    if @page.save

      flash[:notice] = "Page created succesfully."

      redirect_to(:action => "index")

    else
      @subjects = Subject.order('position ASC')
  @page_count = Page.count+1
      render("new")
    end

    
  end

  def edit
  @page=Page.find(params[:id])
  @subjects = Subject.order('position ASC')
  @page_count = Page.count
  end

  def update
    @page = Page.find(params[:id])

       if @page.update_attributes(page_params)
         flash[:notice] = "page update successfuly"

        redirect_to(:action =>  'show',:id => @page.id)

        else
          @subjects = Subject.order('position ASC')
  @page_count = Page.count
      render('edit')
     end

  end

  def delete
@page = Page.find(params[:id])

  end
def destroy

  @page = Page.find(params[:id]).destroy

  

    flash[:notice]= "page is deleted successfuly"
    redirect_to(:action => 'index')


  

  
end
  private

  def page_params
  params.require(:page).permit(:subject_id,:name,:permalink, :position, :visible)
  end
end
