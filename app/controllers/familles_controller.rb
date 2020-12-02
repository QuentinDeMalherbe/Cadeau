class FamillesController < ApplicationController
  def index
    @familles = Famille.all
  end

  def show
    @famille = Famille.find(params[:id])
  end

  def new
    @famille = Famille.new
  end

  def create
    @famille = Famille.new(famille_params)
    if @famille.save
      redirect_to edit_famille_path(@famille)
    else
      render :new
    end
  end

  def edit
    @famille = Famille.find(params[:id])
    if @famille.users.count.zero?
      4.times { @famille.users.build }
    end
  end

  def update
    @famille = Famille.find(params[:id])
    if @famille.update(famille_membre_params)
      redirect_to @famille
    end
  end


  def tirage
    @famille = Famille.find(params[:id])
    users = @famille.users.where('participant = true').map { |u| u.id }.sort
    non_selectionne_users = users.clone
    selectionne_users = []

    users.each_with_index do |user_id, index|
      non_selectionne_users.sort!
      user = User.find(user_id)
      if (index < users.length - 1) || non_selectionne_users.last != user_id
        # enleve l'elt du tableau pour aps qu'il se choississe lui-mem et  si il est dans les non selectionne
        non_selectionne_users.delete(user_id) if non_selectionne_users.include?(user_id)
        # je donne à
        selectionne_user_id = non_selectionne_users.sample
        selectionne_user = User.find(selectionne_user_id)
        # j'enleve le receveur au non selectionné
        non_selectionne_users.delete(selectionne_user_id)
        # je met  le receveur dans les personnes deja selectionné
        selectionne_users << selectionne_user_id
        # je remet lui-meme dans les non-selectionne si il n'est tjrs pas selectionne
        non_selectionne_users << user_id if user.recieve_from_user.nil?
        #  j'enregistre en base
        user.a_selectionne = true
        user.give_to_user = selectionne_user.id
        user.save
        selectionne_user.selectionne = true
        selectionne_user.recieve_from_user = user.id
        selectionne_user.save
      else
        #  cas ou le dernier se retrouve avec lui-meme
        user_precedent = User.find(users[index-1])
        user.a_selectionne = true
        user.give_to_user = user_precedent.give_to_user
        user.recieve_from_user = user_precedent.id
        user_precedent.give_to_user = user.id
        nouveau_receveur_du_dernier = User.where("recieve_from_user = #{user_precedent.id}" )
        nouveau_receveur_du_dernier.recieve_from_user = user.id
        user.save
        user_precedent.save
        nouveau_receveur_du_dernier.save
      end
    end
    redirect_to @famille
  end

  private

  def famille_params
    params.require(:famille).permit(:nom)
  end

  def famille_membre_params
    params.require(:famille).permit(:nom, users_attributes: [:id, :first_name, :participant])
  end
end
