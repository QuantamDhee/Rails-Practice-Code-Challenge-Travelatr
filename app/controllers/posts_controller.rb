class PostsController < ApplicationController

    def show
        find_post
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post
            redirect_to post_path(@post)??
        else
            render :new
        end
    end

    def update
        find_post
        if @post.update
            redirect_to @post
        else
            redirect_to edit_post_path
        end
    end

    # def edit
    #     find_post
    # end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end

end
