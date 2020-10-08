class ThingsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_thing, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @things = Thing.all
    @super_things = Thing.where(shop: 'super')
    @conveni_things = Thing.where(shop: 'conveni')
  end
  
  def show
  end
  
  def new
    @thing = Thing.new
  end
  
  def create
    @thing = Thing.new(adjust_attributes)
    if @thing.save
      flash[:success] = '記録完了！'
      redirect_to @thing
    else
      flash.now[:danger] = '記録に失敗しました。'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @thing.update(adjust_attributes)
      flash[:success] = '商品が編集されました。'
      redirect_to @thing
    else
      flash.now[:danger] = '商品の編集に失敗しました。'
      render :edit
    end
  end
  
  def destroy
    @thing.destroy
    
    flash[:success] = '商品を消去しました。'
    redirect_to things_url
  end

  private
  
  def set_thing
    @thing = Thing.find(params[:id])
  end
  
  def thing_params
    params.require(:thing).permit(:name, :price, :date, :shop)
  end
  
  def adjust_attributes
    attrs = thing_params
    
    if attrs[:shop] == 'super'
      # lowprice に price の内容そのまま、highprice に加工した値段をセット
      # attrs の lowprice キーに price の値を入れる
      attrs[:lowprice] = attrs[:price].to_i
      # attrs の highprice キーに price * 1.3 の値を入れる
      attrs[:highprice] = attrs[:price].to_i*1.3
    else
      # highprice に price の内容そのまま、lowprice に加工した値段をセット
      # 上記の逆パターン
      attrs[:highprice] = attrs[:price].to_i
      attrs[:lowprice] = attrs[:price].to_i*0.7
    end
    # attrs から :price キーを削除
    attrs.delete(:price)
    # 戻り値の希望
    return attrs
    # {name: '名前', lowprice: "1000", highprice: "1200", date: "2020-10-1", shop: "super"}
  end
  
  
end