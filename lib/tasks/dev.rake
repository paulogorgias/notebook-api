namespace :dev do
  desc "Configurando o ambiente de densenvolvimento"
  task setup: :environment do
    puts "zerando banco"
    %x(rails db:drop db:create db:migrate)
    puts "Cadastrado tipos de contatos"
    kinds = %w(Amigos Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts "Tipos de contatos criados com sucesso"
    100.times do |i| 
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(25.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Cadastrado com sucesso"
    puts "Creating phones"


    Contact.all.each do |contact| 
      Random.rand(5).times do |i|
        contact.phones.create!(number: Faker::PhoneNumber.cell_phone)
        contact.save!
      end
    end

puts "Creating address"

    Contact.all.each do |contact| 
      address = Address.create!(street: Faker::Address.street_address,
                              city: Faker::Address.city,
                               contact: contact)

    end
  end

end
