alias DreadnoughtHangar.{Repo, Ability}

Repo.insert!(%Ability{name: ~s(Stasis Ammo), description: ~s(Ammunition that reduces the speed of enemy ships), slot: ~s(Internal Ability), usable_by: ~s(Destroyer), unlock_level: 1337, cr: 1337, sp: 1337, duration: 15, cooldown: 6, icon_uri: ~s(derp), raw_json: %{:placeholder => true}})

Repo.insert!(%Ability{name: ~s(Ability Reboot), description: ~s(Emergency backup generators that, when activated, cycles energy to the ship's subsystems, resetting ability cooldown times.), slot: ~s(Internal Ability), usable_by: ~s(Destroyer), unlock_level: 1337, cr: 1337, sp: 1337, duration: 0, cooldown: 180, icon_uri: ~s(derp), raw_json: %{:placeholder => true}})

Repo.insert!(%Ability{name: ~s(Energy Generator), description: ~s(An additional energy generator that augments your ship's reactor, providing a massive boost to energy regeneration while active.), slot: ~s(Internal Ability), usable_by: ~s(Destroyer), unlock_level: 1337, cr: 1337, sp: 1337, duration: 5, cooldown: 30, icon_uri: ~s(derp), raw_json: %{:placeholder => true}})

Repo.insert!(%Ability{name: ~s(Weapon Amplifier KfC!), description: ~s(Jupiter Arms' Weapon Amplifier is an energy distribution system that pushes all reactor power to a ship's weapon systems. It is widely used by ships in Jupiter Arms' own personal fleet.), slot: ~s(Internal Ability), usable_by: ~s(Destroyer), unlock_level: 1337, cr: 1337, sp: 1337, duration: 10, cooldown: 30, icon_uri: ~s(derp), raw_json: %{:placeholder => true}})