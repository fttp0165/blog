class PostsController < ApplicationController
      before_action :get_posts,only:[:show,:edit,:destroy,:update]
      before_action :clear_params,only:[:create,:update]
      def  index
        @post=Post.order(id: :desc).where("!status")
        @post.each do|p|
          p.created_at =p.created_at + 28800
        end
      end

      def new
        @post=Post.new
  
      end
      def  show
        require "image_processing/mini_magick"
        @comment=PostComment.new
        @comments=@post.post_comments.includes(:post).order(id: :desc)
      end

      def create
        @post=current_user.posts.new(@clear_params)
        if @post.save
         redirect_to root_path
        else
           render :new   
        end
      end

      def edit
      
      end

      def  update
     
       if @post.update(@clear_params)
            redirect_to root_path
       else
            render :edit  
       end
      end

      def destroy
          
            @post.destroy
            redirect_to root_path
      end


      private
      def clear_params
        @clear_params=params.require(:post).permit(:title,:content,:status)
      end
      def get_posts
            @post=Post.find(params[:id])
      end
      def find_user
        @user=User.find(curret_user[:id])
      end
end  
