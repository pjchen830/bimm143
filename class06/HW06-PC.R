---
title: "Homework Class 6 (R Functions)"
author: "Patricia Chen A16138722"
date: "04/27/23"
format: pdf
---
# Section B: Improving analysis code of protein drug interactions

Function that plot B-factor values for given PDB data chain

```{r}

plot_b_factor <- function(p_file, chain) {
  p <- read.pdb(pdb_file)
  p.chain <- trim.pdb(pdb, chain=chain, elety="CA")
  b_factors <- p.chain$atom$b
  plotb3(b_factors, sse=pdb.chain, typ="l", ylab="Bfactor")
}

# Call function for each PDB file chain
plot_b_factor("4AKE", "A")
plot_b_factor("1AKE", "A")
plot_b_factor("1E4Y", "A")

```

In this new code, we defined a function plot_b\_factor that takes a PDB file name and a chain identifier as input, reads the PDB file, trims it to the specified chain, extracts the B-factor values, and plots them using the plotb3 function from the bio3d package.

We then call this function for each PDB file and chain combination. The code is more concise and easier to read, and we can reuse the plot_b\_factor function for other PDB files and chains if needed.

# Answer to Q6
#'Instructions:See Q6 of the hands-on lab supplement above. This entails turning a supplied code snippet into a more robust and re-usable function that will take any of the three listed input proteins and plot the effect of drug binding.


To generalize the original code to work with any set of input protein structures, we can write a function that takes the PDB file name as an argument, reads in the PDB data, and performs the analysis on it.

\#'Function to analyze protein drug interaction from given PDB file 
\#'Input: pdb_file 
\#'Output: Line Plot Residue by Bfactor plotPDB()

```{r}
#start with install.packages(“bio3d”) 

library(bio3d)

#' @param pdb_file PDB code
#' @return Line Plot Residue by Bfactor
#' @export
#' @examples plotPDB("4AKE")

plotPDB <- function(pdb_file) {
  # Extract and read the PDB data
  
  pdb <- read.pdb(pdb_file)
  
  # Trim the PDB file
  pdb.chainA <- trim.pdb(pdb, chain="A", elety="CA")
  
  # Extract B factor values from PDB file
  pdb.atom <- pdb.chainA$atom$b
  
  # Plot B factor values with line plot
  
  plotb3(pdb.atom, sse=pdb.chainA, typ="l", ylab="Bfactor")
}

```

#How to use: The function can be used by calling the function with the name of PDB file as an argument (ie. plotPDB("4AKE")) \# The function reads in the PDB data from the specified file, selects the CA atoms of chain A, calculates the B factors, and plots them using the plotb3 function \# The output of the function is a plot of the B factor for the given protein. \# The function does not return any values, but instead generates a plot in the R graphics window.

#This function takes a PDB file name as input and reads in the data using the read.pdb() function from the bio3d package. It then trims the PDB data to only include the CA atoms of chain A, calculates the B factors, and plots them using the plotb3() function. #To use this function, simply call it with the name of the PDB file you want to analyze:

```{r}
plotPDB("4AKE")
```

#This will read in the PDB data for the protein structure 4AKE, perform the analysis, and plot the B factor.
  