namespace :sessions do
  desc "Supprime les sessions expirées"
  task cleanup: :environment do
    Session.where("created_at < ?", 2.weeks.ago).destroy_all
    puts "Sessions expirées nettoyées."
  end
end
