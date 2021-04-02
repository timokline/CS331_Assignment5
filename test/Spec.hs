-- FNAM: Spec.hs
-- DESC: Test suite for PA5.hs. Independant of pa5_test.hs
-- AUTH: Timothy Albert Kline
-- CRSE: CS F331 - Programming Languages
-- PROF: Glenn G. Chappell
-- STRT: 2021-03-19
-- UPDT: 2021-03-31
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
      assertEqual "Item 0" [0] (take 1 PA5.collatzCounts)

  , testCase "collatzCounts assignment example" $
      assertEqual "List doesn't match" [0,1,7,2,5,8,16,3,19,6] (take 10 PA5.collatzCounts)

  , testCase "findList string found" $
      assertEqual "Incorrect return value" (Just 2) (PA5.findList "cde" "abcdef")

  , testCase "findList string not found" $
      assertEqual "Should be \"Nothing\"" Nothing (PA5.findList "cdX" "abcdef")

  , testCase "findList numerical list nonempty" $
      assertEqual "Wrong return value" (Just 1) (PA5.findList [1] [2,1,2,1,2])

  , testCase "findList numerical list empty" $
      assertEqual "Wrong return value" (Just 0) (PA5.findList [] [1,2,3,4,5])

  , testCase "findList long list from test, #4" $
      assertEqual "Wrong return value" (Just 28) (PA5.findList ([20..25]++[1]) ([3..30]++[20..25]++[1]))

  , testCase "findList long list from test, #5" $
      assertEqual "Wrong return value" (Just 342) (PA5.findList ([50..100]++[1..50])
         ([1..100]++[1..49]++[49..100]++[10..101]++[1..100]++[1..100]++[1..100]++[1..100]))

  , testCase "## two non-empty numerical lists" $
     assertEqual "Incorrect return value" 2 ([1,2,3,4,5] PA5.## [1,1,3,3,9,9,9,9])

  , testCase "## comparison of numericals with empty list" $
     assertEqual "Should be \"Nothing\"" 0 ([] PA5.## [1,1,3,3,9,9,9,9])

  , testCase "## two non-empty string lists" $
      assertEqual "Wrong return value" 3 ("abcde" PA5.## "aXcXeX")

  , testCase "## offset string lists" $
      assertEqual "Wrong return value" 0 ("abcde" PA5.## "XaXcXeX")
  
  , testCase "filterAB two non-empty numerical lists" $
      assertEqual "Wrong list output" [2, 4] (PA5.filterAB (>0) [-1,1,-2,2] [1,2,3,4,5,6])

  , testCase "filterAB numerical and string" $
      assertEqual "Wrong return value" "cde" (PA5.filterAB (==1) [2,2,1,1,1,1,1] "abcde")

  , testCase "findList, longer list #3: not found at end" $
      assertEqual "Wrong value" Nothing (PA5.findList [20,21,22,23,24,25,1] [3..24])

  --, testCase "filtering a string for numerical values" $
  --      assertEqual "Error occurred or wrong output" "235" ()
  ]
