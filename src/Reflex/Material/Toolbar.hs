{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.Toolbar
  ( Fixity(..)
  , ToolbarAlign(..)
  , mdcToolbar_
  , mdcToolbarFixed_
  , mdcToolbarFixedAdjust_
  , mdcToolbarRow_
  , mdcToolbarSection_
  , mdcToolbarSectionAlignStart_
  , mdcToolbarSectionAlignEnd_
  , mdcToolbarTitle_
  , toolbarHeader_
  , toolbarRow_
  , toolbarSection_
  , toolbarTitle_
  , toolbar_
  ) where

import Data.Monoid ((<>))
import Data.Text (Text)
import Reflex.Dom

import Reflex.Material.Types

data Fixity = Fixed | NotFixed

data ToolbarAlign = AlignStart | AlignCenter | AlignEnd

mdcToolbar_ :: CssClass
mdcToolbar_ = CssClass "mdc-toolbar"

mdcToolbarFixed_ :: CssClass
mdcToolbarFixed_ = CssClass "mdc-toolbar--fixed"

mdcToolbarFixedAdjust_ :: CssClass
mdcToolbarFixedAdjust_ = CssClass "mdc-toolbar-fixed-adjust"

mdcToolbarRow_ :: CssClass
mdcToolbarRow_ = CssClass "mdc-toolbar__row"

mdcToolbarSection_ :: CssClass
mdcToolbarSection_ = CssClass "mdc-toolbar__section"

mdcToolbarSectionAlignStart_ :: CssClass
mdcToolbarSectionAlignStart_ = CssClass "mdc-toolbar__section--align-start"

mdcToolbarSectionAlignEnd_ :: CssClass
mdcToolbarSectionAlignEnd_ = CssClass "mdc-toolbar__section--align-end"

mdcToolbarTitle_ :: CssClass
mdcToolbarTitle_ = CssClass "mdc-toolbar__title"

toolbarHeader_ :: DomBuilder t m => Fixity -> m a -> m a
toolbarHeader_ NotFixed = elClass "header" (unCssClass mdcToolbar_)
toolbarHeader_ Fixed    = elClass "header" (unCssClass $ mdcToolbar_ <> mdcToolbarFixed_)

toolbarRow_ :: DomBuilder t m => CssClass -> m a -> m a
toolbarRow_ t = elClass "div" (unCssClass $ mdcToolbarRow_ <> t)

toolbarSection_ :: DomBuilder t m => CssClass -> m a -> m a
toolbarSection_ t = elClass "section" (unCssClass $ mdcToolbarSection_ <> t)

toolbarTitle_ :: DomBuilder t m => Text -> m ()
toolbarTitle_ = elClass "span" (unCssClass mdcToolbarTitle_) . text

toolbar_ :: DomBuilder t m => Fixity -> ToolbarAlign -> Maybe Text -> m a -> m a
toolbar_ f x t c =
  toolbarHeader_ f $
    toolbarRow_ mempty $
      toolbarSection_ tba $
        case t of
          Nothing -> c
          Just t' -> toolbarTitle_ t' >> c
  where
    tba = case x of
            AlignStart  -> mdcToolbarSectionAlignStart_
            AlignCenter -> CssClass ""
            AlignEnd    -> mdcToolbarSectionAlignEnd_
