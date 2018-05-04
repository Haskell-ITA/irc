{-# LANGUAGE OverloadedStrings #-}
module Main where

import Network.Wai.Handler.Warp
import Web.Pager
import Web.Pager.Formatters
import Data.Default.Class
import Lucid
import System.Environment (getArgs)
import System.Exit (exitFailure)

main = do
  _:args <- getArgs
  case args
    of [] -> do putStrLn "USAGE: ircpager IRC_LOG_PATH"
                exitFailure
       path:_ ->
         run 8001 $ pagerApp path def
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

