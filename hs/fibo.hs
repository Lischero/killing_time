import Control.Monad

main :: IO ()
main = readLn >>= print . fibo

fibo :: Integer -> Integer
fibo x
    | x < 2 = x
    | otherwise = last fibs
    where
        fibs = 0 : 1 : walk fibs (x - 1)

walk :: [Integer] -> Integer -> [Integer]
walk _ 0 = []
walk (x : y : zs) n = (x + y) : walk (y : zs) (n - 1)
walk _ _ = error "unreachable"
