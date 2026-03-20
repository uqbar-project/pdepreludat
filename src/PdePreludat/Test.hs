module PdePreludat.Test (shouldBeEqualUpTo2Decimals) where

import Prelude (otherwise, (<), pure, show)
import Redefinitions
import Number
import Test.Hspec

shouldBeEqualWithErrorLessThan :: Number -> Number -> Number -> Expectation       
shouldBeEqualWithErrorLessThan error aNumber anotherNumber
  | abs (aNumber - anotherNumber) < error = pure () -- Esto hace que el test de verde!
  | otherwise = expectationFailure (show aNumber ++ " no es igual (comparando con error < " ++ show error ++ ") a " ++ show anotherNumber)

-- | Función auxiliar para usar en los tests, como 'shouldBe'.
-- 
-- El test pasa si la diferencia entre el primer valor y el segundo es < 0.01.
-- 
-- Por ejemplo, esto pasaría un test:
-- 
-- (1 / 3) \`shouldBeEqualUpTo2Decimals\` 0.33
--
-- Pero esto no:
--
-- (1 / 3) \`shouldBeEqualUpTo2Decimals\` 0.3
shouldBeEqualUpTo2Decimals :: Number -> Number -> Expectation
shouldBeEqualUpTo2Decimals aNumber anotherNumber = shouldBeEqualWithErrorLessThan 0.01 aNumber anotherNumber
