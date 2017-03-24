{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.Button
  ( button_
  , button'_
  , mdcButtonDense_
  , mdcButtonRaised_
  , mdcButtonCompact_
  , mdcButtonPrimary_
  , mdcButtonAccent_
  ) where

import Data.Monoid ((<>))
import Data.Text (Text)
import Reflex.Dom

import Reflex.Material.Types

mdcButton_ :: CssClass
mdcButton_ = CssClass "mdc-button"

mdcButtonDense_ :: CssClass
mdcButtonDense_ = CssClass "mdc-button--dense"

mdcButtonRaised_ :: CssClass
mdcButtonRaised_ = CssClass "mdc-button--raised"

mdcButtonCompact_ :: CssClass
mdcButtonCompact_ = CssClass "mdc-button--compact"

mdcButtonPrimary_ :: CssClass
mdcButtonPrimary_ = CssClass "mdc-button--primary"

mdcButtonAccent_ :: CssClass
mdcButtonAccent_ = CssClass "mdc-button--accent"

button_ :: MonadWidget t m => CssClass -> Text -> m ()
button_ t v = button'_ t v >> pure ()

button'_ :: MonadWidget t m => CssClass -> Text -> m (El t, ())
button'_ t v = elAttr' "button" ("class" =: unCssClass (mdcButton_ <> t)) $ text v
