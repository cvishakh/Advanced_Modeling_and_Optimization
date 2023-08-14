/*********************************************
 * OPL 22.1.0.0 Model
 * Author: visha
 * Creation Date: 17 Jul 2022 at 17:24:06
 *********************************************/
//Index
{string} Warehouses =...;
int NbStores =...;
range Stores =0..NbStores-1;

//Parameters
int FixedCost =...; 
int capacity [Warehouses]=...; 
int SupplyCost[Stores][Warehouses]=...; 


//Decision variables
dvar boolean Open[Warehouses];  
dvar boolean Supply[ Stores][Warehouses];  

//Objective function
minimize  sum( w in Warehouses) FixedCost*  Open [w] + 
          sum(w  in Warehouses, s  in Stores) SupplyCost[s][w]* Supply[s][w];
      
//Constraints
subject to {
  
  forall( s in  Stores)
    cteachStoresHasoneWarehouses: 
    sum( w in Warehouses) Supply[s][w]==1; 
    
  forall( w  in Warehouses, s in Stores)
    ctUseopenWarehouses: 
    Supply[s][w]<=Open[w];
    
  forall( w in Warehouses)
    ctMaxUseOfwarehouses: 
    sum(s in Stores) Supply[s][w]<=capacity[w];   
}
 