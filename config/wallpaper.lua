local wallpapers = {
    "1582915184",
    "873452754",
    "1948961570",
    "951259031",
    "862333935",
    "827148653",
    "3110652378",
    "3165088714",
    "2786967173"
}

-- Seed the randomizer using current system time
math.randomseed(os.time())

-- Return a random ID from the list
return wallpapers[math.random(#wallpapers)]