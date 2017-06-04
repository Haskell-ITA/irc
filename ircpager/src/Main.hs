{-# LANGUAGE OverloadedStrings #-}
module Main where

import Network.Wai.Handler.Warp
import Web.Pager
import Web.Pager.Formatters
import Data.Default.Class
import Lucid

main = run 8001 $ pagerApp "/var/irclog/irc.freenode.net/#haskell-it/out" def
  { title = "#haskell-it IRC log"
  , perPage = 200
  , tableHead = ["Date", "Time", "Username", "Message"]
  , formatLine = irc
  , extraMetas = metas }

metas :: Html ()
metas = do
  meta_ [name_ "description", content_ "IRC log for #haskell.it on freenode, the Italian Haskell community"]
  meta_ [name_ "keywords"   , content_ "haskell,haskell-ita,italy,irc,log"]
  --link_ [href_ "/assets/irc/css/main.css", rel_ "stylesheet", media_ "all"]

