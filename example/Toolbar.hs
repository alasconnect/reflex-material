{-# LANGUAGE OverloadedStrings #-}

module Toolbar where

import Reflex.Dom

import Reflex.Material.Toolbar

toolbar :: MonadWidget t m => m ()
toolbar = toolbar_ True AlignStart (Just "Example Reflex-Material") $ pure ()
