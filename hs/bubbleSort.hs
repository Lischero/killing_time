import Control.Arrow (second)
import Control.Monad.Writer
import Data.Monoid

main :: IO ()
main = getLine
    >>= print . bubbleSortWithCount . map (read :: String -> Int) . words

bubbleSortWithCount :: (Ord a) => [a] -> ([a], Int)
bubbleSortWithCount xs
    | flag = second (count +) $ bubbleSortWithCount res
    | otherwise = (res, count)
    where
        (res, (Any flag, Sum count)) = runWriter $ innerBSort xs

innerBSort :: (Ord a) => [a] -> Writer (Any, Sum Int) [a]
innerBSort (x : y : zs)
    | x > y = (:) <$> writer (y, (Any True, Sum 1)) <*> innerBSort (x : zs)
    | otherwise = (x :) <$> innerBSort (y : zs)
innerBSort xs = return xs
