class PostsController < ApplicationController
  def index
    @posts = Post.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PostPdf.new @posts
        send_data pdf.render, filename: "allpost.pdf", type: "application/pdf"
      end
    end
  end

  def show
    @post = Post.find params[:id]
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "post", :layout => 'pdf.html.erb', :template => "posts/show.pdf.erb"
      end
    end
  end
end
