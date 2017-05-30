{-# LANGUAGE OverloadedStrings #-}

module FormElement where

import Data.Monoid ((<>))
import Reflex.Dom

import Reflex.Material.Checkbox
import Reflex.Material.TextField
import Reflex.Material.Radio
import Reflex.Material.FormField
import Reflex.Material.Select
import Reflex.Material.Typography
import Reflex.Material.Types

formElements :: MonadWidget t m => m ()
formElements = do
  title_ "Text Fields"
  el "div" $ do
    el "section" $
      textFieldContainer_ mdcTextFieldUpgraded_ $ do
        textFieldLabel_ mempty "Basic Input"
        textFieldInput'_ mempty

    el "section" $
      textFieldContainer_ mdcTextFieldUpgraded_ $ do
        textFieldLabel_ mempty "Password Input"
        textFieldPasswordInput'_ mempty

    el "section" $ do
      el "label" $ text "Full Width Basic Input"
      textFieldContainer_ (mdcTextFieldUpgraded_ <> mdcTextFieldFullWidth_) $ do
        textFieldInput'_ mempty

  title_ "Radio Buttons"
  el "div" $ do
    el "section" $ do
      formFieldContainer_ mempty $ do
        radio'_ Enabled NotSelected "rdio1" "A"
        el "label" $ text "A"
      formFieldContainer_ mempty $ do
        radio'_ Enabled Selected "rdio1" "B"
        el "label" $ text "B"
      formFieldContainer_ mempty $ do
        radio'_ Enabled NotSelected "rdio1" "C"
        el "label" $ text "C"

    subheading2_ "Disabled"

    el "section" $ do
      formFieldContainer_ mempty $ do
        radio'_ Disabled Selected "rdio2" "A"
        el "label" $ text "A"
      formFieldContainer_ mempty $ do
        radio'_ Disabled NotSelected "rdio2" "B"
        el "label" $ text "B"
      formFieldContainer_ mempty $ do
        radio'_ Disabled NotSelected "rdio2" "C"
        el "label" $ text "C"


  title_ "Checkboxes"
  el "div" $ do
    el "section" $ do
      formFieldContainer_ mempty $ do
        checkbox'_ Enabled NotSelected "A"
        el "label" $ text "A"
      formFieldContainer_ mempty $ do
        checkbox'_ Enabled Selected "B"
        el "label" $ text "B"
      formFieldContainer_ mempty $ do
        checkbox'_ Enabled NotSelected "C"
        el "label" $ text "C"

    subheading2_ "Disabled"

    el "section" $ do
      formFieldContainer_ mempty $ do
        checkbox'_ Disabled Selected "A"
        el "label" $ text "A"
      formFieldContainer_ mempty $ do
        checkbox'_ Disabled NotSelected "B"
        el "label" $ text "B"
      formFieldContainer_ mempty $ do
        checkbox'_ Disabled NotSelected "C"
        el "label" $ text "C"

  title_ "Select"

  let os = [ Option Enabled Selected Default "fish" "Fish"
           , Option Enabled NotSelected NotDefault "chips" "Chips"
           , Option Enabled NotSelected NotDefault "vinegar" "Vinegar"
           , Divider
           , Option Enabled NotSelected NotDefault "dog" "Dog"
           , Option Disabled NotSelected NotDefault "cat" "Cat"
           , Option Enabled NotSelected NotDefault "cow" "Cow"
           , Group Enabled "Cheese" [ Option Enabled NotSelected NotDefault "cheddar" "Cheddar"
                                    , Option Enabled NotSelected NotDefault "swiss" "Swiss"
                                    , Option Enabled NotSelected NotDefault "american" "American"]
           , Option Enabled NotSelected NotDefault "the end" "The End"
           ]

  el "div" $ do
    el "section" $ do
      select'_ Enabled os
      pure ()

    subheading2_ "Disabled"

    el "section" $ do
      select'_ Disabled os
      pure ()