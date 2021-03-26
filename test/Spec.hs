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
  [ testCase "collatzCounts iteration 1" $
      assertEqual "Item 0" [0] (take 1 collatzCounts)

  , testCase "collatzCounts assignment example" $
      assertEqual "List doesn't match" [0,1,7,2,5,8,16,3,19,6] (take 10 collatzCounts)

  , testCase "findList string found" $
      assertEqual "Incorrect return value" (Just 2) (findList "cde" "abcdef")

  , testCase "findList string not found" $
      assertEqual "Should be \"Nothing\"" Nothing (findList "cdX" "abcdef")

  , testCase "findList numerical list nonempty" $
      assertEqual "Wrong return value" (Just 1) (findList [1] [2,1,2,1,2])

  , testCase "findList numerical list empty" $
      assertEqual "Wrong return value" (Just 0) (findList [] [1,2,3,4,5])

  , testCase "findList long list from test, #4" $
      assertEqual "Wrong return value" (Just 28) (findList ([20..25]++[1]) ([3..30]++[20..25]++[1]))

  , testCase "findList long list from test, #5" $
      assertEqual "Wrong return value" (Just 342) (findList ([50..100]++[1..50])
            (h++[1..49]++[49..100]++[10..101]++h++h++h++h))
  ]
