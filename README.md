# QBCore CleanUI (cui) character
An advanced character and clothes editor that aims to be comfortable to use, hide complexity and blend in with original GTA V interface elements.

## IMPORTANT

**In qb-interior/client/furnished.lua at line 118 replace:**

```TriggerEvent('qb-clothes:client:CreateFirstCharacter')```

with

```TriggerEvent('cui_character:open', { 'identity', 'features', 'style', 'apparel' }, false)```

**In qb-multicharacter/client/main.lua at line 114 replace:**

```TriggerEvent('qb-clothing:client:loadPlayerClothing', data, charPed)```

with

```TriggerEvent('cui_character:loadClothes', data, charPed)```

## Character Customization Features
I tried to cover every feature that GTA Online character creator offers, notably:

* Heritage (parent face and skin color blending) working exactly like the one made by Rockstar
* Property names displayed whenever possible instead of raw numbers

I have made improvements in places where I thought Rockstar's creator didn't do a particularly good job:

* Properties are grouped in a more intuitive way
* "2D grids" have been replaced with sliders
* Percentage values are clearly displayed

## Additional features

* Flexible camera that can be zoomed and rotated with mouse as well as switched between `face`, `body` and `legs` views
* Native, in-game sound effects
* Optional (configurable) map locations where characters can be customzied after creation (barber shops, hospital plastic surgery units, clothes shops)
* Optional clothes component/prop blacklisting (uncomment `client/blacklist.lua` in fxmanifest client_scripts, then edit the file)

## Requirements and usage notes

[xnTattoos](https://github.com/ihyajb/xnTattoos)

**Editing and saving characters to the database *should* work out-of-the-box.**

## Credits
Thanks to [SaltyGrandpa](https://github.com/SaltyGrandpa) for helping to make it standalone

Thanks to DudeRockTV#7528 for letting me use what he started and make it better!

Admins can use `/identity`, `/features`, `/style`, `/apparel` commands to open respective tabs or `/character` to open full character customization anywhere.

## Known Issues

### Soon, still WIP
