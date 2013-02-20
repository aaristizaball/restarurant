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
      {:title => "Gaseosas",     :category_id => "1", :image => "1", :price => "3000", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {:title => "Jugos Naturales",     :category_id => "1", :image => "2", :price => "4500", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {:title => "Cocteles",     :category_id => "1", :image => "3", :price => "10000", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {:title => "Cafe",     :category_id => "1", :image => "4", :price => "2000", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {:title => "Moka",     :category_id => "1", :image => "5", :price => "3000", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {:title => "Postre 1",     :category_id => "2", :image => "6", :price => "3000", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {:title => "Postre 2",     :category_id => "2", :image => "7", :price => "3000", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {:title => "Postre 3",     :category_id => "2", :image => "8", :price => "3000", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {:title => "Postre 4",     :category_id => "2", :image => "9", :price => "3000", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {:title => "Postre 5",     :category_id => "2", :image => "10", :price => "3000", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {:title => "Ajiaco",     :category_id => "3", :image => "ajiaco", :price => "15000", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {:title => "Sopa de Fideos",     :category_id => "3", :image => "fideos", :price => "5000", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {:title => "Frijoles",     :category_id => "3", :image => "frijoles", :price => "12000", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {:title => "Sopa de Papa",     :category_id => "3", :image => "papa", :price => "6000", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {:title => "Sancocho",     :category_id => "3", :image => "sancocho", :price => "11000", :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."}
    ].each do |attributes|
      Dish.find_or_create_by_title(attributes)
    end
  end

end
