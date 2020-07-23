-- todo: automatically generate playlist "temp" as empty playlist on open                           
-- fix the song function so user can be prompted to choose song if multiple results                 
on run argv                                                                                         
                                                                                                    
    if (item 1 of argv = "getplaylists") then                                                       
        tell application "Music"                                                                    
            get name of playlists                                                                   
        end tell                                                                                    
    end if                                                                                          
                                                                                                    
    if (item 1 of argv = "favorites") then                                                          
        tell application "Music"                                                                    
            play playlist "Favorites Mix"                                                           
        end tell                                                                                    
    end if                                                                                          
                                                                                                    
    if (item 1 of argv = "pause") then                                                              
        tell application "Music"                                                                    
            pause                                                                                   
        end tell                                                                                    
    end if                                                                                          
                                                                                                    
    if (item 1 of argv = "resume") then                                                             
        tell application "Music"                                                                    
            play                                                                                    
        end tell                                                                                    
    end if                                                                                          
                                                                                                    
    if (item 1 of argv = "skip") then                                                               
        tell application "Music"                                                                    
            play (next track)                                                                       
        end tell                                                                                    
    end if                                                                                          
                                                                                                    
    if (item 1 of argv = "artist") then                                                             
        tell application "Music"                                                                    
            --removing every song in old temp playlist before adding new ones                       
            try                                                                                     
                delete tracks of playlist "temp"                                                    
            on error                                                                                
            end try                                                                                 
            --adding new tracks                                                                     
            set theTracks to (every track of playlist "Library" whose artist contains item 2 of argv)
                                                                                                    
            --shuffles songs in list as it adds them                                                
            set trackCount to count of theTracks                                                    
            set outputList to {}                                                                    
            if (trackCount > 10) then                                                               
                repeat with i from trackCount to 1 by -1                                            
                    -- getting random tracks from artist                                            
                    set j to (((random number) * (i - 1)) as integer) + 1                           
                    set tempTrack to theTracks's item j                                             
                    copy tempTrack to the end of the outputList   
                    
                  set outputLength to count of outputList                                         
                    if (outputLength > 10) then                                                     
                        exit repeat                                                                 
                    end if                                                                          
                end repeat                                                                          
            end if                                                                                  
            if (trackCount <= 10) then                                                              
                repeat with i from trackCount to 1 by -1                                            
                    set j to (((random number) * (i - 1)) as integer) + 1                           
                    set tempTrack to theTracks's item j                                             
                    copy tempTrack to the end of the outputList                                     
            --        set j to (((random number) * (i - 1)) as integer) + 1                         
            --        set tempTrack to theTracks's item i                                           
            --        set theTracks's item i to theTracks's item j                                  
            --        set theTracks's item j to tempTrack                                           
                end repeat                                                                          
            end if                                                                                  
            repeat with theTrack in outputList                                                      
                copy theTrack to playlist "temp"                                                    
            end repeat                                                                              
            play playlist "temp"                                                                    
        end tell                                                                                    
    end if                                                                                          
                                                                                                    
    if (item 1 of argv = "song") then                                                               
        tell application "Music"                                                                    
            --removing every song in old temp playlist before adding new ones                       
            try                                                                                     
                delete tracks of playlist "temp"                                                    
            end try                                                                                 
            --adding new tracks                                                                     
            set theTracks to (every track of playlist "Library" whose name contains item 2 of argv) 
            set trackCount to count of theTracks                                                    
            repeat with i from trackCount to 1 by -1                                                
                set tempTrack to theTracks's item i                                                 
                copy tempTrack to playlist "temp"                                                   
            end repeat                                                                              
            play playlist "temp"                                                                    
        end tell                                                                                    
    end if                                                                                          
    
    if (item 1 of argv = "volume") then   
        if (item 2 of argv = "loud") then                                                           
            set volume output volume 80                                                             
        end if                                                                                      
                                                                                                    
        if (item 2 of argv = "quiet") then                                                          
            set volume output volume 20                                                             
        end if                                                                                      
                                                                                                    
        if (item 2 of argv = "medium") then                                                         
            set volume output volume 50                                         
        if (item 2 of argv = "medium") then
            set volume output volume 50
        end if

        if (item 2 of argv = "quieter") then
            set volume output volume (output volume of (get volume settings) - 10) --100%           
        end if

        if (item 2 of argv = "louder") then
            set volume output volume (output volume of (get volume settings) + 10) --100%           
        end if
        
    end if

    if (item 1 of argv = "love") then
        tell application "Music"
            set loved of current track to true
        end tell
    end if

end run
