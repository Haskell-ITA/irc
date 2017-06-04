#!/bin/bash

messaggio="Logs disponibili all'indirizzo http://irc.fgaz.me"

sleep 13 # non si sa mai

echo "/j #haskell-it" >> /var/irclog/irc.freenode.net/in
#echo "messaggio iniziale inviato"
#echo $messaggio >> /var/irclog/irc.freenode.net/#haskell.it/in
#tail -f /var/irclog/irc.freenode.net/#haskell.it/out | grep --line-buffered logger | sed -u "s@.*@$messaggio@" >> /var/irclog/irc.freenode.net/#haskell.it/in

