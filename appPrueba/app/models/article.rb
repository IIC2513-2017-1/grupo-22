class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    #Rails includes methods to help you validate the data that you send to models. Open the app/models/article.rb file and edit it:
     validates :title, presence: true,
                    length: { minimum: 5 }

end


#ApplicationRecord inherits from ActiveRecord::Base which supplies a great deal of functionality to your Rails models for free, including basic
# database CRUD (Create, Read, Update, Destroy) operations, data validation, as well as sophisticated search support and the ability to relate multiple 
# models to one another.