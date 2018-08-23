class IdeaController < ApplicationController
  def display_ideas
  	@ideas=Idea.all
  	@user=User.find(session[:user_id])
  	render "idea/display_ideas" and return
  end

  def display_idea_likes

  	@user=User.find(params[:uid])
    @idea=Idea.find(params[:iid])
    @ideas = @idea.users
  	render "idea/display_idea_likes" and return

  end

  def display_user_details
  	@user=User.find(params[:id])
  	render "idea/display_user_details" and return

  end

  def new_idea

  	@user=User.find(params[:id])

  	puts "****************** Content here:", idea_params[:content]
  	Idea.create(content: (idea_params[:content]), user_id: @user.id)
    redirect_to "/idea/display_ideas" and return

  end

  def like_idea

  	Like.create(user_id: params[:uid], idea_id: params[:iid])
  	redirect_to "/idea/display_ideas" and return

  end

  def delete_idea

    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to "/idea/display_ideas" and return

  end

    private

  def idea_params
    params.require(:idea).permit(:content, :user_id)
  end

  def like_params
    params.require(:user).permit(:user_id, :idea_id)
  end

end
