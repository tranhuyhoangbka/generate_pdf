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
end
