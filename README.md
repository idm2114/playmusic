# play music

This program is designed explicitly for Apple Music users. It will not work with Spotify users, but I have seen many other comparable programs for Spotify. Essentially, this program takes some of the most commonly used functions in the Apple Music ecosystem and builds on tops of them to try and create a seamless terminal environment (because no one likes getting distracted because they tried to change their music). 

# Functions

Every function should be proceeded by the command-line call ```play```.
For example, if I wanted to listen to Kendrick Lamar, I would type: 
``` play artist "kendrick lamar"```
### getplaylists
- pretty straightforward. gets your playlists and lists them.

### favorites
- plays a playlist of your favorite songs (according to apple music)

### pause
- obvious

### resume
- it is to pause what start is to stop

### skip
- plays the next song in the queue

### artist "NAME"
- takes in an artist name (case-insensitive) and plays a shuffled assortment of songs by them that are in your collection. 
- requires multiple arguments (need to pass in an artist name)

### song "NAME"
- takes in a song name (case-insensitive, based on fuzzy search) and returns a list of songs that match.
- if you were looking for the Bill Withers classic "Ain't No Sunshine", for example, and typed ```play song sunshine``` you might find that a new temporary playlist has been made with every song that has sunshine in the title.
- For this reason, unless you like that sort of thing, I recommend searching for song names as specifically as possible.

### volume {params}
- the volume command gives you control over the volume of your speaker system on your computer.
- the current paramaters that are enabled are loud, medium, quiet, louder, and quieter.

### love
- adds the currently playing track to your list of favorites in apple music.
