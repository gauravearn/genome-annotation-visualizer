# genome-annotation-visualizer

a R function part to visualizae the genes coming from the genome alignment. it adds the stranded information with in the R function so that it makes easier for the visualizer to analyze the genes. You can find the support for the multiple genes and the different ones in the evoseq [evoseq](https://github.com/sablokgaurav/evoseq-genome-informatics). 

- This is a part of the evoseq R package due for release next week. However you can use the function as a separate one.
- the sample figure is present and the sample file also. 
- vectorized function so faster.
- run the function as 
```
genevisualize <- function(genomealigned, annotationlevel)
 # where genomealigned is the gff file 
 # annotationlevel = mRNA
 # store the output as a list 
 output <- genevisualize(sample.gff, "mRNA")
```
- plot the genes as 
```
library(ggplot2)
library(gggenes)
ggplot(output, aes(xmin = start, xmax = end, y = molecule, fill = gene)) +
  geom_gene_arrow() +
  facet_wrap(~ molecule, scales = "free", ncol = 1) +
  scale_fill_brewer(palette = "Set3")
```
- adding a new variable declaration which allows you to change the ids of the specific molecules.

<img src="https://github.com/sablokgaurav/genome-annotation-visualizer/blob/main/genome-annotation-visualizer-new.png" alt="image" width="500" height="auto" align = "center">

Gaurav \
Academic Staff Member \
Bioinformatics \
Institute for Biochemistry and Biology \
University of Potsdam \
Potsdam,Germany


