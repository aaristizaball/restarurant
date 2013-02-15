namespace :app do

  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nI'm sorry, Dave, I can't do that.\n(You're asking me to drop your production database.)"
    end
  end

  desc "Reset"
  task :reset => [:ensure_development_environment, "db:drop", "db:create", "db:migrate", "db:seed", "app:populate"]

  desc "Populate the database with development data."
  task :populate => :environment do
    [
      {:title => "Gaseosas",     :category_id => "1", :image => "1"},
      {:title => "Jugos Naturales",     :category_id => "1", :image => "2"},
      {:title => "Cocteles",     :category_id => "1", :image => "3"},
      {:title => "Cafe",     :category_id => "1", :image => "4"},
      {:title => "Moka",     :category_id => "1", :image => "5"},
      {:title => "Postre 1",     :category_id => "2", :image => "6"},
      {:title => "Postre 2",     :category_id => "2", :image => "7"},
      {:title => "Postre 3",     :category_id => "2", :image => "8"},
      {:title => "Postre 4",     :category_id => "2", :image => "9"},
      {:title => "Postre 5",     :category_id => "2", :image => "10"},
      {:title => "Ajiaco",     :category_id => "3", :image => "ajiaco"},
      {:title => "Sopa de Fideos",     :category_id => "3", :image => "fideos"},
      {:title => "Frijoles",     :category_id => "3", :image => "frijoles"},
      {:title => "Sopa de Papa",     :category_id => "3", :image => "papa"},
      {:title => "Sancocho",     :category_id => "3", :image => "sancocho"}
    ].each do |attributes|
      Dish.find_or_create_by_title(attributes)
    end
  end

end
