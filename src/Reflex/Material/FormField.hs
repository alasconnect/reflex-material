{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.FormField
  ( formFieldContainer_
  , mdcFormFieldAlignEnd_
  ) where

import Data.Monoid ((<>))
import Data.Text (Text)
import Reflex.Dom

import Reflex.Material.Types

mdcFormField_ :: CssClass
mdcFormField_ = CssClass "mdc-form-field"

mdcFormFieldAlignEnd_ :: CssClass
mdcFormFieldAlignEnd_ = CssClass "mdc-form-field--align-end"

formFieldContainer_ :: DomBuilder t m => CssClass -> m a -> m a
formFieldContainer_ t = elClass "div" (unCssClass (mdcFormField_ <> t))
