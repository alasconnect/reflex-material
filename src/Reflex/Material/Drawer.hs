{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.Drawer
  ( mdcPermanentDrawer_
  , mdcPermanentDrawerContent_
  , mdcPermanentDrawerToolbarSpacer_
  , drawer_
  , drawerContent_
  , spacer_
  ) where

import Reflex.Dom

import Reflex.Material.Types

mdcPermanentDrawer_ :: CssClass
mdcPermanentDrawer_ = CssClass "mdc-permanent-drawer"

mdcPermanentDrawerContent_ :: CssClass
mdcPermanentDrawerContent_ = CssClass "mdc-permanent-drawer__content"

mdcPermanentDrawerToolbarSpacer_ :: CssClass
mdcPermanentDrawerToolbarSpacer_ = CssClass "mdc-permanent-drawer__toolbar-spacer"

drawer_ :: MonadWidget t m => CssClass -> m a -> m a
drawer_ t = elClass "nav" (unCssClass t)

drawerContent_ :: MonadWidget t m => m a -> m a
drawerContent_ = elClass "div" (unCssClass mdcPermanentDrawerContent_)

spacer_ :: MonadWidget t m => m ()
spacer_ = elClass "div" (unCssClass mdcPermanentDrawerToolbarSpacer_) $ pure ()
