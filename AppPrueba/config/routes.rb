Rails.application.routes.draw do

  resources :articles  do 
      resources :comments   # This creates comments as a nested resource within articles
  end
  
  #  A resource is the term used for a collection of similar objects, such as articles, people 
  # or animals. You can create, read, update and destroy items for a resource

  # get 'welcome/index'
  ## get 'welcome/index' tells Rails to map requests to http://localhost:3000/welcome/index
  root 'welcome#index'
  # root 'welcome#index'
  ##  tells Rails to map requests to the root of the application to the welcome controller's 
  ##  index action 

  # A controller's purpose is to receive specific requests for the application. Routing decides which controller receives which requests. Often, 
  # there is more than one route to each controller, and different routes can be served by different actions. Each action's purpose is to collect 
  #information to provide it to a view.

  # LA INFORMACION ESTA EN EL CONTROLADOR, NO EN LAS VISTAS (SOLO SON PARA MOSTRAR LAINFO)
end
