import Data.List

main :: IO ()
main = getLine >>= print . euclidean . sortBy (flip compare) . map read . words

euclidean :: [Integer] -> Integer
euclidean [a, b]
    | m == 0 = b
    | otherwise = euclidean [b, m]
    where
        m = a `mod` b
