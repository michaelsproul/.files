function music_sync
    rsync --modify-window=1 --update --times --exclude='.DS_Store' --delete-excluded -rv ~/Music/PhoneMusic/ /Volumes/PHONE/Music/
end

