type Pizza = (Double, Double)

getPizzaArea :: Double -> Double
getPizzaArea diameter = pi * (diameter / 2) ^ 2

getCostPerInch :: Pizza -> Double
getCostPerInch (diameter, cost) = cost / getPizzaArea diameter

getLowestCostPerInchPizza :: Pizza -> Pizza -> Pizza
getLowestCostPerInchPizza pizza1 pizza2 =
  if costPizza1 < costPizza2
    then pizza1
    else pizza2
  where
    costPizza1 = getCostPerInch pizza1
    costPizza2 = getCostPerInch pizza2

printPizza :: Pizza -> String
printPizza (diameter, cost) =
  "The " ++ show diameter ++ " pizza "
    ++ "is cheaper at "
    ++ show costPerSqInch
    ++ " per square inch"
  where
    costPerSqInch = getCostPerInch (diameter, cost)

main :: IO ()
main = do
  putStrLn "What is the size of pizza 1"
  diameter1 <- getLine
  putStrLn "What is the cost of pizza 1"
  cost1 <- getLine
  putStrLn "What is the size of pizza 2"
  diameter2 <- getLine
  putStrLn "What is the cost of pizza 2"
  cost2 <- getLine
  let pizza1 = (read diameter1, read cost1)
  let pizza2 = (read diameter2, read cost2)
  let betterPizza = getLowestCostPerInchPizza pizza1 pizza2
  putStrLn (printPizza betterPizza)
