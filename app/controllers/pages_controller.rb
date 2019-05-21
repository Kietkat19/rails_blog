class PagesController < ApplicationController
  # Shows all of the pages
  # Read
  def index
    @pages = Page.all 
    # Render index.hitml.erb
  end

  # Show a single page
  # Read
  def show
    @page = Page.find(params[:id])
    # Render show.html.erb
  end

  # Shows the create form
  # New page in memory 
  def new
    @page = Page.new
    # Render new.html.erb
  end

  # POST
  # Try add on to the database
  def create 
    @page = Page.new(pages_params)

    if @page.save
      redirect_to pages_path
    else
      render :new 
    end
  end

  # Show the edit form
  def edit
    @page = Page.find(params[:id])
    # Render edit.html.erb
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(pages_params)
      redirect_to pages_path
    else
      render :edit 
    end
  end

  def destroy 
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end

  # CRUD 
  # Create
  # Read
  # Update
  # Destroy

  private

    def pages_params
      # attr_accessors 
      # { page: {title: 'new' ...}}
      params.require(:page).permit(:title, :author, :body)
      # { title: 'new' ...}
    end
end
