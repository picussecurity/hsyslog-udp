{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import qualified System.Posix.Syslog.UDPSpec as UDPSpec
import System.Posix.Syslog.UDP
import Test.Hspec

main :: IO ()
main = do
    logMessages
    runSpecs

logMessages :: IO ()
logMessages = do
    syslog <- defaultConfig >>= initSyslog
    syslog User Debug "hello thar!"

runSpecs :: IO ()
runSpecs =
    hspec $ do
      describe "System.Posix.Syslog.UDP" UDPSpec.spec
