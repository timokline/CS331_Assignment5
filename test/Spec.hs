-- FNAM: Spec.hs
-- DESC: Test suite for PA5.hs. Independant of pa5_test.hs
-- AUTH: Timothy Albert Kline
-- CRSE: CS F331 - Programming Languages
-- PROF: Glenn G. Chappell
-- STRT: 2021-03-19
-- UPDT: N/A
-- VERS: 1.0
module Main where

import Test.Tasty
import Test.Tasty.SmallCheck as SC
import Test.Tasty.QuickCheck as QC
import Test.Tasty.HUnit

import PA5


main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [properties, unitTests]


properties :: TestTree
properties = testGroup "Properties" [scProps, qcProps]


scProps = testGroup "SmallCheck Tests"
  [ SC.testProperty "integer division" $
      \n -> (n :: Integer) <= 10 SC.==> 1 == 1
  ]

qcProps = testGroup "QuickCheck Tests"
  [ QC.testProperty "integer division" $
      \n -> (n :: Integer) <= 10 QC.==> 1 == 1
  ]


unitTests :: TestTree
unitTests = testGroup "Unit Tests"
  [ testCase "Empty set" $
      assertEqual "Empty" [] (take 0 collatzCounts)

  , testCase "collatzCounts iteration 1" $
      assertEqual "Item 0" [0] (take 1 collatzCounts)

  , testCase "collatzCounts assignment example" $
      assertEqual "List doesn't match" [0,1,7,2,5,8,16,3,19,6] (take 10 collatzCounts)

  ]
