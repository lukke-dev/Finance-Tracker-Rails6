class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end

  def search
    if params[:friend].present?
      @friend = params[:friend]
      if @friend
        respond_to do |format|
          format.js { render partial: 'users/friend_result' }
        end
      else
        flash.now[:alert] = "Não foi encontrado nenhum usuario com este nome ou email: #{params[:friend]}"
        respond_to do |format|
          format.js { render partial: 'users/friend_result' }
        end
      end
    else
      flash.now[:alert] = 'Por favor entre com nome ou email para pesquisar'
      respond_to do |format|
        format.js { render partial: 'users/friend_result' }
      end
    end
  end
end
