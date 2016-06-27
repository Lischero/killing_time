import Control.Monad.Writer
import Data.List
import Data.Monoid

main = getLine
    >>= print . insertSortWithCount . map (read :: String -> Int) . words

insertSortWithCount :: (Ord a) => [a] -> ([a], Int)
insertSortWithCount (x : xs) = (res, c + count)
    where
        (pre, c) = insertSortWithCount xs
        (res, Sum count) = runWriter $ innerISort x pre
insertSortWithCount _ = ([], 0)

innerISort :: (Ord a) => a -> [a] -> Writer (Sum Int) [a]
innerISort p [] = return [p]
innerISort p (x : xs)
    | x < p = (:) <$> writer (x, Sum 1) <*> innerISort p xs
    | otherwise = return $ p : x : xs
