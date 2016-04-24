{-# LANGUAGE FlexibleContexts #-}
module Lib where

import Control.Applicative
import Diagrams.Prelude
import Diagrams.Backend.PGF.CmdLine

pipeline :: Diagram PGF
pipeline = foldr1 (|||) labelledBlocks
  where
    block name color = label name <> (rect 20 10 # fcA color)
    label name = text name # bold
                           # fontSize (local 2)
                           # font "Computer Modern Teletype L"
                           # fc white
    colours = map (`withOpacity` 0.75)
             [ red, orange, green, blue, purple ]
    stages = [ "IF", "ID", "EXE", "MEM", "WB"   ]
    labelledBlocks = getZipList $
                       block <$> ZipList stages <*> ZipList colours



draw :: Diagram PGF -> IO ()
draw = defaultMain . pad 1.1 . scale 3
