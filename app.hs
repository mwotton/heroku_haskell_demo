import Network.Loli
import Hack.Handler.SimpleServer
import Maybe
import System.Environment

main = do
  port <- getEnv "PORT"
  run (fromIntegral $ read port) . loli $ do

    get "/echo/:user" $ do
      text . ("Hi, " ++) . fromJust . lookup "user" =<< captures

    get "/" (text "homebrew hello world")
