class StaticController < ApplicationController
  def index
    #binding.pry
    DemoWorker.perform_async([1, 2, 3].sample)
  end
end
