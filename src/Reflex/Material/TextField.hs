{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.TextField
  ( textFieldContainer_
  , textFieldInput'_
  , textFieldLabel_
  , textFieldPasswordInput'_
  , mdcTextFieldFullWidth_
  , mdcTextFieldUpgraded_
  ) where

import Data.Monoid ((<>))
import Data.Text (Text)
import Reflex.Dom

import Reflex.Material.Types

mdcTextField_ :: CssClass
mdcTextField_ = CssClass "mdc-textfield"

mdcTextFieldUpgraded_ :: CssClass
mdcTextFieldUpgraded_ = CssClass "mdc-textfield--upgraded"

mdcTextFieldFullWidth_ :: CssClass
mdcTextFieldFullWidth_ = CssClass "mdc-textfield--fullwidth"

mdcTextFieldLabelFloatAbove_ :: CssClass
mdcTextFieldLabelFloatAbove_ = CssClass "mdc-textfield__label--float-above"

mdcTextFieldInput_ :: CssClass
mdcTextFieldInput_ = CssClass "mdc-textfield__input"

mdcTextFieldLabel_ :: CssClass
mdcTextFieldLabel_ = CssClass "mdc-textfield__label"

textFieldContainer_ :: DomBuilder t m => CssClass -> m a -> m a
textFieldContainer_ t = elClass "div" (unCssClass (mdcTextField_ <> t))

textFieldInput'_ :: DomBuilder t m => CssClass -> m (Element EventResult (DomBuilderSpace m) t, ())
textFieldInput'_ t = elClass' "input" (unCssClass (mdcTextFieldInput_ <> t)) blank

textFieldPasswordInput'_ :: DomBuilder t m => CssClass -> m (Element EventResult (DomBuilderSpace m) t, ())
textFieldPasswordInput'_ t = elAttr' "input" ("type" =: "password" <> "class" =: unCssClass (mdcTextFieldInput_ <> t)) blank

textFieldLabel_ :: DomBuilder t m => CssClass -> Text -> m ()
textFieldLabel_ t = elClass "label" (unCssClass (mdcTextFieldLabel_ <> mdcTextFieldLabelFloatAbove_ <> t)) . text
