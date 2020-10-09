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
    @things = current_user.things
    @super_things = @things.where(shop: 'super')
    @conveni_things = @things.where(shop: 'conveni')
  end
  
end
