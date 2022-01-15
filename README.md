# Optimal sando frontrun amount

Haven’t public code/math for calculating optimal frontrun sandwich amounts (@libevm’s [subway](https://github.com/libevm/subway) and @Supercycled [cake_sniper](https://github.com/Supercycled/cake_sniper) both use binary search) so here’s a thread on how to derive perfect sando amounts: 

The problem statement is: given some amountIn and amountMinOut (from a pending tx), what is the worst ratio (price) between the uniswap reserves must be such that the swap still goes through? Once we know the worst ratio, we can calculate exactly how much $ we need to push the pool to this ratio.  

We should do this onchain at the time of execution, rather than offchain in a binary search. So that if someone beats us to the frontrun, we won’t get rekt and revert the meat transaction. 

![deriv](https://user-images.githubusercontent.com/97774772/149609045-839f12a0-ad20-477b-b968-f0058047fbd3.png)
