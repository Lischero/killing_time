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
walk (x : y : zs) n
    | n == 0 = []
    | otherwise = (x + y) : walk (y : zs) (n - 1)
walk _ _ = error "unreachable"
