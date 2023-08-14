/*********************************************
 * OPL 22.1.0.0 Model
 * Author: visha
 * Creation Date: 14 Jul 2022 at 10:17:58
 *********************************************/
//Index
{int} branches = ...; //set of branches
{int} warehouses= ...; //set of warehouses

//Parameters
int demand[warehouses]= ...; //demand of products
int supply[branches]= ...;   //suppy of products
int tcost[branches][warehouses]=...; //total transportation cost
 
//Decision variables
dvar float+ amounttransp[branches][warehouses];
 
//Decision expression
dexpr float transpcost = sum( i in branches, j in warehouses) 
 amounttransp[i][j]*tcost[i][j];
 
//Objective fun
minimize transpcost;
 
//Constraints
 subject to {
   supplycons:
   forall( i in warehouses)
     sum( j in branches) amounttransp[i][j]<=supply[i];
     demandcons:
   forall(j in branches)
     sum(i in warehouses) amounttransp[i][j]==demand[j];
   forall(i in branches, j in warehouses)
     amounttransp[i][j] >= 0;
 }
 