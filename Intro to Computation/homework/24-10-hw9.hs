module HW9 where

rint :: IO Int
rint = do
    str <- getLine
    return (read str :: Int)

calc :: Int -> IO Int
calc 0 = return 0
calc n = do
    a <- rint
    s <- calc (n - 1)
    return $ a + s

adder :: IO ()
adder = do
    putStr "How many numbers? "
    n <- rint
    s <- calc n
    putStrLn $ "The total is " ++ show s

-- 第二题无需提交代码