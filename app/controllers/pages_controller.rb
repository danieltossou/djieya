class PagesController < ApplicationController
  def index
  end

  def users
    @users = User.all
  end

  def user 
    @user = User.find(params[:id])
  end

  def activer
    @user = User.find(params[:id])
    @user.update(etat: true)
  end

  def desactiver
    puts "+++++++++++++++++++++++++++++="
    @user = User.find(params[:id])
    @user.update(etat: false)
  end

  def employes
  end

  def menu_annees
  end
  
  def menu_classes
    
  end
  
  
end
