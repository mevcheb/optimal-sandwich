pragma solidity ^0.8.10;

contract OptimalSando {
    // 1. obtain amountIn, amountOut, k, fee (9970 for 30 bps uni) from the mempool
    // 2. on-chain, calculate worstReserves
    // 3. swapInAmount = currentRIn - worstRIn
    // 4. do the swap
    // 5. in the next tx, sell all bought tokens
     function worstReserves(uint amountIn, uint amountOut, uint k, uint fee) pure internal returns (uint256){ 
        int negb = (-int(fee) * int(amountIn));
        int fourac = (int(40000) * int(fee) * int(amountIn) * int(k))/int(amountOut);
        int squareroot = sqrt((int(fee)*int(amountIn))**2 + fourac);
        uint worstRIn = uint((negb + squareroot)/int(20000));
        return worstRIn, k/worstRIn;
    }
}
