# Inscryption Multiplayer Script

This repository contain custom sigil code for IMF. All the sigils here should are safe to be run on your machine and thus the game will automatically download these without asking you for confirmation unlike other none trusted sigil.

## Installation

To install one of these sigils click on the file you want to download, we will use [`Chungus.gd`](Chungus.gd) for this example. After opening the file copy the url and put it in your `custom_sigils` field like this:
```json
...
"custom_sigils": {
    "Chungus": {
        "description": "Big",
        "author": "107zxz",
        "url": "https://raw.githubusercontent.com/107zxz/inscr-onln-scripts/main/Chungus.gd",
        "icon_url": "https://raw.githubusercontent.com/107zxz/inscr-onln/main/gfx/sigils/Airborne.png"
    }
}
...
```

The block contain the following:
  - The key to this block (in this case `Chungus`) will be the sigil name you can reference in your ruleset
  - The `description` field is the sigil description.
  - The `author` field is use to credit the creator of the sigil. Some sigil are in sub-directory, the sub-directory that the sigil is in is the author name
  - The `url` field is the link that you copy above and tell the game what file to download.
  - The `icon_url` field is the link to the sigil icon that the game will download.

# Contribution

If you are a dev and want to contribute sigil to this repository, add your sigil into a sub-directory with your name (or whatever you want to be refer to) along with anything extra you might want. You may also include a `README.md` that contain note on installation along with any extra documentation you think your player would need.
