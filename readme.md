# Discovering Worlds

Having completed my first Love2d project and submitting it to a game jam, I am looking for a second
project to complete within a day for the same jam. I think what I'll do is make a "1X" game,
a 4X game that only has "explore" implemented. I'll use Love2d again because it's an easy and fun
engine that I can publish both as a downloadable and on the web (via Love.js).

I'll also try generating maps following the plog page
[Undiscovered Worlds - Basic Continents](https://undiscoveredworlds.blogspot.com/2019/02/basic-continents.html)
as I have an interest in learning terrain generation techniques for other projects.

## Temp hacks to fix

- I intend to have two coordinate systems, the raster graphics and the logical map coordinates with an object representation, but for now all dimensions are hard-coded and a map tile seems to be about 20x20 pixels. But I'm more interested in terrain generation in the near term, so logical map tiles can wait.

## Building

The Love2d game is in src/ . The rest of this repo is for building it and preparing to deploy to Itch.io . It relies on node and npm to install Love.js .

- Love2d, node, and npm need to be installed, and zip is needed to make the zip file
- `npm install` downloads Love.js
- `npm run-script build` creates the release/ folder and converts the Love2d project in src/ to html in release/
- `npm run-script zip` will delete any existing discovering-worlds.zip file and then create a new one with the contents of release/
- `npm run-script love` will delete any existing discovering-worlds.love cartridge file and then create a new one with the contents of src/
- discovering-worlds.zip can then be uploaded to Itch.io
- Caddyfile is to configure the caddy webserver which I am using locally. Just run `caddy` in the repo root folder, and the game will be available at http://localhost:2015 after release/ is populated by the build
