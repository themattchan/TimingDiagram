{-# LANGUAGE FlexibleContexts #-}
module Lib where

import Diagrams.Prelude
import Diagrams.Backend.PGF.CmdLine

pipeline :: Diagram PGF
pipeline = foldr1 (|||) $ map blk [ "IF", "ID", "EXE", "MEM", "WB" ]
  where blk name = rect 20 10 <> text name



-- example :: Diagram PGF
-- example = square 1
--       ||| rect 0.3 0.5
--       ||| triangle 1
--       ||| roundedRect  0.5 0.4 0.1
--       ||| roundedRect  0.5 0.4 (-0.1)
--       ||| roundedRect' 0.7 0.4 (with & radiusTL .~ 0.2
--                                      & radiusTR .~ -0.2
--                                      & radiusBR .~ 0.1)

draw :: Diagram PGF -> IO ()
draw = defaultMain . pad 1.1
