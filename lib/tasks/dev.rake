namespace :dev do
  desc "Configurando o ambiente de densenvolvimento"
  task setup: :environment do
    100.times do |i| 
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(25.years.ago, 18.years.ago)
      )


    end
    puts "Cadastrado com sucesso"
  end

  end
