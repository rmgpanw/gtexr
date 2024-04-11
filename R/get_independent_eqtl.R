get_independent_eqtl <- function(gencodeId,
                                 tissueSiteDeatilId,
                                 datasetId = "gtex_v8",
                                 page = 0,
                                 itemsPerPage = 250){
  gtex_query(endpoint = "assocation/independentEqtl")
}
