class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.find(:all, :order => "id desc", :limit => 30).reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def populate
    count = params[:count] || 999
    s = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non tellus at nulla semper pretium. Pellentesque vitae nunc eleifend, aliquam tellus a, ultrices turpis. Integer id ipsum molestie, congue dolor id, faucibus augue. Cras non lacus dignissim, pellentesque libero vitae, egestas nisi. Vestibulum id massa diam. Pellentesque sed bibendum libero, ut dignissim tellus. Fusce euismod sem eu neque egestas, et congue neque lobortis. Morbi lectus purus, rutrum sed rhoncus tempor, fringilla in arcu. Pellentesque bibendum dictum elit ac dictum. Praesent in lectus tortor."
    (1..count).each do |i|
      Post.create!(title: "Title-#{count}", content: "Content-#{count}\n\n#{s}")
    end
  end


end
