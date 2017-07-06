#' A vector of 298 visually distinctive colours
#'
#' @format Each element of the vector is a colour hex code
#' 
#' @source \url{http://graphicdesign.stackexchange.com/revisions/3815/8} and other places
"distinct.col"


#' The variant allele frequencies of somatic single nucleotide variants 
#' from whole genome sequencing of a primary myelofibrosis patient at three time points
#'
#' @format A list with three fields
#' \itemize{
#'   \item x. A matrix of allele frequencies
#'   \item y. Clustering labels from the original publication
#'   \item metadata. A list with one field: the gene names of each mutation
#' }
#' 
#' @references 
#' Engle, E., Fisher, D., Miller, C., McLellan, M., Fulton, R., Moore, D., Wilson, R., Ley,T., and Oh, S. (2015). 
#' Clonal evolution revealed by whole genome sequencing in a case of primary myelofibrosis transformed to 
#' secondary acute myeloid leukemia. Leukemia, 29(4), 869-876.
#' 
#' 
"PMF"


#' The variant allele frequencies of somatic single nucleotide variants 
#' from whole genome sequencing of a AML patient at two time points
#'
#' @format A list with two fields
#' \itemize{
#'   \item x. A matrix of allele frequencies
#'   \item y. Clustering labels from the original publication
#' }
#' 
#' @references 
#' Miller, C. A., White, B. S., Dees, N. D., Griffith, M., Welch, J. S., Griffith, O. L.,
#' Vij, R., Tomasson, M. H., Graubert, T. A., Walter, M. J., et al. (2014). 
#' SciClone: Inferring clonal architecture and tracking the spatial and temporal patterns 
#' of tumor evolution. PLoS Comput. Biol., 10(8).
#' 
"AML28"


#' The variant allele frequencies of somatic single nucleotide variants 
#' from whole genome sequencing of the lung/pancreatic metastasis of a melanoma patient
#'
#' @format A list with one field
#' \itemize{
#'   \item x. A matrix of allele frequencies
#' }
#' 
#' @references 
#' Ding, L., Kim, M., Kanchi, K. L., Dees, N. D., Lu, C., Griffith, M., Fenstermacher,
#'  D., Sung, H., Miller, C. A., Goetz, B., et al. (2014). Clonal architectures and driver
#'  mutations in metastatic melanomas. PLoS ONE, 9(11).
"MEL5"


#' Single cell gene expression data from 11 populations
#'
#' @format A list with two fields
#' \itemize{
#'   \item x. A cell-gene matrix of gene expression values
#'   \item metadata. A list with one field: the cell type of each cell
#' }
#' 
#' @references 
#' Pollen, A. A., Nowakowski, T. J., Shuga, J., Wang, X., Leyrat, A. A., Lui, J. H., Li, N., 
#' Szpankowski, L., Fowler, B., Chen, P., et al. (2014). 
#' Low-coverage single-cell mrna sequencing reveals cellular heterogeneity 
#' and activated signaling pathways in developing cerebral cortex. 
#' Nat. Biotechnol., 32(10), 1053-1058.
#' 
#' 
"single.cell.mrna.pollen"


#' Single cell gene expression data from 223 stem cells 
#' from the subentricular zone of eight-week-old male mice
#'
#' @format A list with two fields
#' \itemize{
#'   \item x. A cell-gene matrix of gene expression values
#'   \item metadata. A list with only one field: the cell type of each cell
#' }
#' 
#' @references 
#' Llorens-Bobadilla, E., Zhao, S., Baser, A., Saiz-Castro, G., Zwadlo, K., and Martin-Villalba, A. (2015). 
#' Single-cell transcriptomics reveals a population of dormant neural stem cells 
#' that become activated upon brain injury. Cell Stem Cell. 10.1016/j.stem.2015.07.002.
#' 
"single.cell.mrna.florens"


#' Single-cell CyTOF data of bone marrow mononuclear cells from a healthy individual
#'
#' @format A list with two fields
#' \itemize{
#'   \item x. A cell-protein markers matrix of protein expression values
#'   \item metadata. A list with two fields: 1) the cell types of each cell and (2) the t-SNE coordinates
#' }
#' 
#' @references 
#' Bendall, S. C., Simonds, E. F., Qiu, P., El-ad, D. A., Krutzik, P. O., Finck, R., Bruggner, 
#' R. V., Melamed, R., Trejo, A., Ornatsky, O. I., et al. (2011). 
#' Single-cell mass cytometry of differential immune and drug responses 
#' across a human hematopoietic continuum. Science, 332(6030), 687-696.
#' 
"cytof.benchmark.one"


#' Single-cell CyTOF data of bone marrow mononuclear cells from a healthy individual H1
#'
#' @format A list with two fields
#' \itemize{
#'   \item x. A cell-protein markers matrix of protein expression values
#'   \item metadata. A list with two fields: 1) the cell type of each cell and (2) the t-SNE coordinates
#' }
#' 
#' @references 
#' Levine, J. H., Simonds, E. F., Bendall, S. C., Davis, K. L., El-ad, D. A., Tadmor, 
#' M. D., Litvin, O., Fienberg, H. G., Jager, A., Zunder, E. R., et al. (2015). 
#' Data- driven phenotypic dissection of aml reveals progenitor-like cells 
#' that correlate with prognosis. Cell, 162(1), 184-197.
#' 
"cytof.benchmark.h1"


#' Single-cell CyTOF data of bone marrow mononuclear cells from a healthy individual H2
#'
#' @format A list with two fields
#' \itemize{
#'   \item x. A cell-protein markers matrix of protein expression values
#'   \item metadata. A list with two fields: 1) the cell type of each cell and (2) the t-SNE coordinates
#' }
#' 
#' @references 
#' Levine, J. H., Simonds, E. F., Bendall, S. C., Davis, K. L., El-ad, D. A., Tadmor, 
#' M. D., Litvin, O., Fienberg, H. G., Jager, A., Zunder, E. R., et al. (2015). 
#' Data- driven phenotypic dissection of aml reveals progenitor-like cells 
#' that correlate with prognosis. Cell, 162(1), 184-197.
#' 
"cytof.benchmark.h2"

