{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.Toolbar
  ( ToolbarAlign(..)
  , mdcToolbar_
  , mdcToolbarFixed_
  , mdcToolbarFixedAdjust_
  , mdcToolbarSection_
  , mdcToolbarSectionAlignStart_
  , mdcToolbarSectionAlignEnd_
  , mdcToolbarTitle_
  , toolbarHeader_
  , toolbarSection_
  , toolbarTitle_
  , toolbar_
  ) where

import Data.Monoid ((<>))
import Data.Text (Text)
import Reflex.Dom

import Reflex.Material.Types

data ToolbarAlign = AlignStart | AlignCenter | AlignEnd

mdcToolbar_ :: CssClass
mdcToolbar_ = CssClass "mdc-toolbar"

mdcToolbarFixed_ :: CssClass
mdcToolbarFixed_ = CssClass "mdc-toolbar--fixed"

mdcToolbarFixedAdjust_ :: CssClass
mdcToolbarFixedAdjust_ = CssClass "mdc-toolbar-fixed-adjust"

mdcToolbarSection_ :: CssClass
mdcToolbarSection_ = CssClass "mdc-toolbar__section"

mdcToolbarSectionAlignStart_ :: CssClass
mdcToolbarSectionAlignStart_ = CssClass "mdc-toolbar__section--align-start"

mdcToolbarSectionAlignEnd_ :: CssClass
mdcToolbarSectionAlignEnd_ = CssClass "mdc-toolbar__section--align-end"

mdcToolbarTitle_ :: CssClass
mdcToolbarTitle_ = CssClass "mdc-toolbar__title"

toolbarHeader_ :: MonadWidget t m => Bool -> m a -> m a
toolbarHeader_ False = elClass "header" (unCssClass mdcToolbar_)
toolbarHeader_ True  = elClass "header" (unCssClass $ mdcToolbar_ <> mdcToolbarFixed_)

toolbarSection_ :: MonadWidget t m => CssClass -> m a -> m a
toolbarSection_ t = elClass "section" (unCssClass $ mdcToolbarSection_ <> t)

toolbarTitle_ :: MonadWidget t m => Text -> m ()
toolbarTitle_ = elClass "span" (unCssClass mdcToolbarTitle_) . text

-- | The 'True' will fix the toolbar to the top.
toolbar_ :: MonadWidget t m => Bool -> ToolbarAlign -> Maybe Text -> m a -> m a
toolbar_ f x t c =
  toolbarHeader_ f $
    toolbarSection_ tba $
      case t of
        Nothing -> c
        Just t' -> toolbarTitle_ t' >> c
  where
    tba = case x of
            AlignStart  -> mdcToolbarSectionAlignStart_
            AlignCenter -> CssClass ""
            AlignEnd    -> mdcToolbarSectionAlignEnd_
