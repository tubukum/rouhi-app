class ThingsController < ApplicationController
  def index
    @things = Thing.all
  end
  
  def show
    @thing = Thing.find(params[:id])
  end
  
  def new
    @thing = Thing.new
  end
  
  def create
    @thing = Thing.new(thing_params)
    
    if @thing.save
      flash[:success] = '記録完了！'
      redirect_to @thing
    else
      flash.now[:danger] = '記録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @thing = Thing.find(params[:id])
  end
  
  def update
    @thing = Thing.find(params[:id])
    
    if @thing.update(thing_params)
      flash[:success] = '商品が編集されました。'
      redirect_to @thing
    else
      flash.now[:danger] = '商品の編集に失敗しました。'
      render :edit
    end
  end
  
  def destroy
    @thing = Thing.find(params[:id])
    @thing.destroy
    
    flash[:success] = '商品を消去しました。'
    redirect_to things_url
  end
  
  def thing_params
    params.require(:thing).permit(:name)
  end
end
