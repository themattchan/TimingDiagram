module Lib where

import Diagrams.Prelude
import Diagrams.Backend.PGF.CmdLine

pipeline :: Diagram B
pipeline = rect 0.10 0.5 ||| rect 0.4 0.5

example :: Diagram B
example = square 1
      ||| rect 0.3 0.5
      ||| triangle 1
      ||| roundedRect  0.5 0.4 0.1
      ||| roundedRect  0.5 0.4 (-0.1)
      ||| roundedRect' 0.7 0.4 (with & radiusTL .~ 0.2
                                     & radiusTR .~ -0.2
                                     & radiusBR .~ 0.1)

draw :: Diagram B -> IO ()
draw d = defaultMain (pad 1.1 d)
