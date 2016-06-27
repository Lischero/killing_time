import Control.Arrow
import Data.List

main = getLine
    >>= print . mergeSort . map (read :: String -> Int) . words

mergeSort :: (Ord a) => [a] -> [a]
mergeSort xs@(_ : _ : _) = merge (mergeSort ys) (mergeSort zs)
    where
        (ys, zs) = splitAt (length xs `div` 2) xs
mergeSort xs = xs

merge :: (Ord a) => [a] -> [a] -> [a]
merge (x : xs) (y : ys)
    | x > y = y : merge (x : xs) ys
    | otherwise = x : merge xs (y : ys)
merge xs [] = xs
merge _ ys = ys
