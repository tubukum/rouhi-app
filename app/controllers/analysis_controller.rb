class AnalysisController < ApplicationController
  before_action :classed_things, only: [:positive, :negative]
  
  def index
  end
  
  def positive
  end
  
  def negative
  end
  
  private
  
  def classed_things
    @things = Thing.all
    @super_things = Thing.where(shop: 'super')
    @conveni_things = Thing.where(shop: 'conveni')
  end
  
end
