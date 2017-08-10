{-# LANGUAGE OverloadedStrings #-}

module Buttons where

import Data.Monoid ((<>))
import Reflex.Dom

import Reflex.Material.Button
import Reflex.Material.Typography

buttons :: DomBuilder t m => m ()
buttons = do
  title_ "Buttons"
  button_ mempty "Default"
  button_ (mdcButtonDense_ <> mdcButtonRaised_) "Dense Raised" 
  button_ mdcButtonPrimary_ "Default Primary"
  button_ (mdcButtonPrimary_ <> mdcButtonRaised_) "Primary Raised" 
  button_ (mdcButtonPrimary_ <> mdcButtonDense_) "Primary Dense" 
  button_ mdcButtonAccent_ "Default Accent"
  button_ (mdcButtonAccent_ <> mdcButtonRaised_) "Accent Raised" 
  button_ (mdcButtonAccent_ <> mdcButtonDense_) "Accent Dense" 
