require("pry-byebug")
require_relative("./models/bounty_hunters.rb")



hunter1 = BountyHunters.new({
"first_name" => "Death",
"last_name" => "Head",
"species" => "Robot",
"homeworld" => "Styrakos",
"cash_in" => 30

  })

hunter1.save



  hunter2 = BountyHunters.new({
  "first_name" => "Boba",
  "last_name" =>  "Fett",
  "species" => "Human Clone",
  "homeworld" => "Kamino",
  "cash_in" => 70


    })

hunter2.save

    binding.pry
        nil
