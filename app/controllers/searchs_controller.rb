class SearchsController < ApplicationController

  def search
    @model = params["model"]#選択したmodel
    @content = params["content"]#検索ワード
    @method = params["method"]#検索方法の値
    #上3個をsearchに代入し@records に代入
    @records = search_for(@model, @content, @method)
    byebug
  end

  private
  def search_for(model, content, method)
    if model == 'user'
    if method == "foward_match"
      User.where(name "#{content}%")   #前方一致
    elsif method == "backward_match"
      User.where(name "%#{content}")   #後方一致
    elsif method == "perfect_match"
      User.where(name: "#{content}")                 #全一致
    elsif method == "partial_match"
      User.where(name: "%#{content}%")  #部分一致
    else
      User.all
    end
    #上記user検索
    elsif model == 'reptile'
    if method == "foward_match"
      Reptile.where(title: "#{content}%")
    elsif method == "backward_match"
      Reptile.where(title: "%#{content}")
    elsif method == "perfect_match"
      Reptile.where(title: "#{content}")
    elsif method == "partial_match"
      Reptile.where(title: "%#{content}%")
    else
      Reptile.all
    end
    end
  end



end
