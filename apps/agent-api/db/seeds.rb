# Créer 10 utilisateurs avec des IDs uniques
users = 10.times.map do |i|
  User.create!(
    openloot_id: "user_#{rand(1000..9999)}", # ID unique basé sur un numéro aléatoire
    email_address: "user_#{i}@example.com",
    password: "password",
    is_premium: [true, false].sample,
    level: rand(1..50),
    experience: rand(0..5000)
  )
end

# Créer différentes raretés
rarities = %w[Common Uncommon Rare Epic Legendary Mythic Exalted Exotic Transcendent Unique MVP].map do |rarity_name|
  Rarity.create!(name: rarity_name)
end

# Définir l'efficacité selon la rareté
efficiency_by_rarity = {
  "Common" => 100,
  "Uncommon" => 205,
  "Rare" => 420,
  "Epic" => 1292,
  "Legendary" => 3974,
  "Mythic" => 12219,
  "Exalted" => 37574,
  "Exotic" => 154054,
  "Transcendent" => 631620,
  "Unique" => 2589642
}

# Créer plusieurs badges et showrunner_contracts pour chaque utilisateur
users.each do |user|
  # Créer entre 1 et 5 badges pour chaque utilisateur
  rand(1..5).times do
    rarity = rarities.sample
    rarity_name = rarity.name

    # Créer un badge avec efficacité en fonction de la rareté
    badge = Badge.create!(
      user: user,
      name: "Top Player Badge for #{user.openloot_id}",
      rarity: rarity,
      purchase_price: rand(50.0..500.0).round(2),
      efficiency: efficiency_by_rarity[rarity_name],  # Assigner l'efficacité
      assetable: user,  # Associer l'utilisateur comme assetable
      assetable_type: 'User'  # Préciser le type d'assetable
    )
  end

  # Créer entre 1 et 3 showrunner_contracts pour chaque utilisateur
  rand(1..3).times do
    rarity = rarities.sample
    # Créer un showrunner_contract avec une rareté aléatoire
    showrunner_contract = ShowrunnerContract.create!(
      user: user,
      name: "Contract for #{user.openloot_id}",
      rarity: rarity,
      purchase_price: rand(50.0..500.0).round(2),
      assetable: user,  # Associer l'utilisateur comme assetable
      assetable_type: 'User'  # Préciser le type d'assetable
    )
  end
end

puts "10 utilisateurs, leurs badges et leurs showrunner contracts ont été créés avec succès !"
puts "Nombre de badges : #{Badge.count}, nombre de showrunner contracts : #{ShowrunnerContract.count}"
