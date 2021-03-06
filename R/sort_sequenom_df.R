
##################################################################################################
##################################################################################################
##################################################################################################
##Sequenom Data frame Sort

#########################################################################
#' Sequenom Data frame Sort
#'
#' @description
#' This function sorts Sequenom Data at the read-in stage.
#'
#' @param Sequenom_Data2Sort data frame to sort produced with the
#' genotypeR package
#' @param sort_char is the character string output by the PERL pipeline in the marker design phase
#' (i.e., chr 1000 1050 AAA[A/T]GTC; the chr is the sort_char. Defaults to chr or contig. 
#' @keywords sort sequenom
#' @return A sorted data frame suited for the genotypeR package
#' @export
#' @examples
#' 
#' data(genotypes_data)
#' sort_sequenom_df(genotypes_data)
#' 
sort_sequenom_df <- function(Sequenom_Data2Sort, sort_char="chr|contig"){
colnames_seq_df <- colnames(Sequenom_Data2Sort)

colnames_to_sort <- colnames_seq_df[grep(sort_char, colnames_seq_df)]

colnames_sort_df <- data.frame(do.call(rbind, strsplit(colnames_to_sort, "_(?=[0-9])", perl=TRUE)))

colnames_sort_df$colnumbers <- 3:(length(colnames_to_sort)+2)

new_order <- colnames_sort_df[order(colnames_sort_df[,1], as.numeric(as.character(colnames_sort_df[,2]))),]

sort_by_this <- c(1, 2, new_order$colnumbers)

sorted_df <- Sequenom_Data2Sort[,sort_by_this]

return(sorted_df)
}
##################################################################################################
##################################################################################################
##################################################################################################

