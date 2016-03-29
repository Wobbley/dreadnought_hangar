# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DreadnoughtHangar.Repo.insert!(%DreadnoughtHangar.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias DreadnoughtHangar.{Repo, Ship}

#Corvettes
Repo.insert!(%Ship{name: "Defiant", description: "Badass description", armor: 9001, type: "Corvette", class: "Light", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/corvette_light.png"})
Repo.insert!(%Ship{name: "Fulgora", description: "Badass description", armor: 9001, type: "Corvette", class: "Medium", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/corvette_medium.png"})
Repo.insert!(%Ship{name: "Veles", description: "Badass description", armor: 9001, type: "Corvette", class: "Heavy", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/corvette_heavy.png"})

#Destroyers
Repo.insert!(%Ship{id: 4, name: "Vulcan", description: "Badass description", armor: 9001, type: "Destroyer", class: "Light", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/destroyer_light.png"})
Repo.insert!(%Ship{id: 5, name: "Renegade", description: "Badass description", armor: 9001, type: "Destroyer", class: "Medium", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/destroyer_medium.png"})
Repo.insert!(%Ship{id: 6, name: "Morena", description: "Badass description", armor: 9001, type: "Destroyer", class: "Heavy", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/destroyer_heavy.png"})

#Dreadnoughts
Repo.insert!(%Ship{id: 7, name: "Invictus", description: "Badass description", armor: 9001, type: "Dreadnought", class: "Light", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/dreadnought_light.png"})
Repo.insert!(%Ship{id: 8, name: "Zmey", description: "Badass description", armor: 9001, type: "Dreadnought", class: "Medium", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/dreadnought_medium.png"})
Repo.insert!(%Ship{id: 9, name: "Monarch", description: "Badass description", armor: 9001, type: "Dreadnought", class: "Heavy", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/dreadnought_heavy.png"})

#Tactical Cruisers
Repo.insert!(%Ship{id: 10, name: "Defender", description: "Badass description", armor: 9001, type: "Tactical Cruiser", class: "Light", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/tactical_light.png"})
Repo.insert!(%Ship{id: 11, name: "Aion", description: "Badass description", armor: 9001, type: "Tactical Cruiser", class: "Medium", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/tactical_medium.png"})
Repo.insert!(%Ship{id: 12, name: "Koschei", description: "Badass description", armor: 9001, type: "Tactical Cruiser", class: "Heavy", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/tactical_heavy.png"})

#Artillery Cruiser
Repo.insert!(%Ship{id: 13, name: "Nox", description: "Badass description", armor: 9001, type: "Artillery Cruiser", class: "Light", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/artillery_light.png"})
Repo.insert!(%Ship{id: 14, name: "Svarog", description: "Badass description", armor: 9001, type: "Artillery Cruiser", class: "Medium", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/artillery_medium.png"})
Repo.insert!(%Ship{id: 15, name: "Vigilant", description: "Badass description", armor: 9001, type: "Artillery Cruiser", class: "Heavy", unlock_level: 1337, cr: 1337, sp: 1337, shield: "Mitigation", icon_uri: "https://dreadnoughthangar.com/images/ships/artillery_heavy.png"})