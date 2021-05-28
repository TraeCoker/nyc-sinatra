class LandmarksController < ApplicationController
  
  get '/landmarks' do 
    @landmarks = Landmark.all 
    erb :'landmarks/index'
  end 

  get '/landmarks/new' do
    @titles = Title.all 
    @figures = Figure.all 

    erb :'landmarks/new'
   end 

   post '/landmarks' do 
    @landmark = Landmark.create(name: params[:name], year_completed: params[:year_completed])

    redirect "/landmarks/#{@landmark.id}"
   end 

   get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])

    erb :'landmarks/show'
   end 

   get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])

    erb :'landmarks/edit'
   end 

   patch '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])

    @landmark.update(name: params[:landmark][:name]) if !params[:landmark][:name].blank?
    @landmark.update(year_completed: params[:landmark][:year_completed]) if !params[:landmark][:year_completed].blank?

    redirect "/landmarks/#{@landmark.id}"
   end
end
