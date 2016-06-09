import Control.Monad

main :: IO ()
main = readLn >>= print . fibo

fibo :: Integer -> Integer
fibo x = last fibs
    where
        fibs = 0 : 1 : walk fibs x

walk :: [Integer] -> Integer -> [Integer]
walk (x : y : zs) n
    | n < 0 = []
    | otherwise = x : walk (y : x + y : zs) (n - 1)
walk _ _ = error "unreachable"
