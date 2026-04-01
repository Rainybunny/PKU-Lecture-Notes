module Main where

import System.Random

-- Problem #4: 猜数字小游戏

getInt :: IO Int
getInt = do
    str <- getLine
    return (read str :: Int)

guessLoop :: Int -> IO ()
guessLoop x = do
    putStrLn "Guess an integer in [1,100]:"
    x' <- getInt
    if x' == x then do
        putStrLn "Correct!"
    else if x' < x then do
        putStrLn "Too small."
        guessLoop x
    else do
        putStrLn "Too big."
        guessLoop x

main :: IO ()
main = do
    x <- randomRIO (1, 100)
    -- putStrLn $ "Guessing " ++ show x
    guessLoop x
-- End Problem #4
