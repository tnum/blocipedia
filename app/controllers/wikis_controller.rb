class WikisController < ApplicationController

  def index
    @wikis = Wiki.where(is_private: false)
  end

  def show
    @wiki =Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)
    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki post saved."
      redirect_to @wiki
    else
      flash[:error] = "Error, wiki post not saved."
      redirect_to new_wiki_path
    end

  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    if @wiki.update_attributes(wiki_params)
      redirect_to @wiki
    else
      flash[:error] = "Error saving wiki, please try again"
      render :edit
    end

  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    if @wiki.destroy
      flash[:notice] = "Successfully deleted"
      redirect_to root_path
    else
      flash[:error] = "There was an error deleting this wiki post"
      render :show
    end
    
  end
  
end

private

def wiki_params
  params.require(:wiki).permit(:title, :body, :is_private)
end