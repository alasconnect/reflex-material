{-# LANGUAGE OverloadedStrings #-}

module Toolbar where

import Reflex.Dom

import Reflex.Material.Toolbar

toolbar :: DomBuilder t m => m ()
toolbar = toolbar_ Fixed AlignStart (Just "Example Reflex-Material") $ pure ()
