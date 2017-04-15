module Test.Main where

import Prelude
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Aff.Console (CONSOLE, log)
import Control.Monad.Eff (Eff)
import Data.String.HtmlElements (decode, encode)
import Test.Unit (suite, test)
import Test.Unit.Assert (assert)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)

main :: forall e.
  Eff
    ( console :: CONSOLE
    , testOutput :: TESTOUTPUT
    , avar :: AVAR
    | e
    )
    Unit
main = runTest do
  suite "Data.String.HtmlElements" do
    let target =  "&#x3BC;&#x2019;&#xFF53; &#x65B0; dumpster fire - 01"
    let input = "μ’ｓ 新 dumpster fire - 01"
    test "encode" do
      let encoded = encode input
      log $ input <> " becomes " <> encoded
      assert "encode some string" $
        encoded == target
    test "decode" do
      let decoded = decode target
      log $ target <> " becomes " <> decoded
      assert "encode some string" $
        decoded == input
