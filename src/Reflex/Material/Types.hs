{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.Types
  ( Img(..)
  , CssClass(..)
  , Default (..)
  , Enabled(..)
  , Selected (..)
  , SelectOption (..)
  ) where

import Data.Monoid ((<>))
import Data.Text (Text)

newtype CssClass = CssClass { unCssClass :: Text }

instance Monoid CssClass where
  mempty = CssClass ""
  mappend (CssClass a) (CssClass b) = CssClass (a <> " " <> b)

data Img = Img Text Int Int Text -- file, width, height, alt

data Enabled = Enabled | Disabled
data Selected = Selected | NotSelected
data Default = Default | NotDefault
data SelectOption = Option Enabled Selected Default Text Text
                  | Group Enabled Text [SelectOption]
                  | Divider
