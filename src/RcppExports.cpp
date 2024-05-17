// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// ProjectVersion
void ProjectVersion();
RcppExport SEXP _StockInit_ProjectVersion() {
BEGIN_RCPP
    Rcpp::RNGScope rcpp_rngScope_gen;
    ProjectVersion();
    return R_NilValue;
END_RCPP
}
// InitDF
DataFrame InitDF(const std::string& path, const std::vector<std::string>& columns, const int& range, const std::string& FitType);
RcppExport SEXP _StockInit_InitDF(SEXP pathSEXP, SEXP columnsSEXP, SEXP rangeSEXP, SEXP FitTypeSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::string& >::type path(pathSEXP);
    Rcpp::traits::input_parameter< const std::vector<std::string>& >::type columns(columnsSEXP);
    Rcpp::traits::input_parameter< const int& >::type range(rangeSEXP);
    Rcpp::traits::input_parameter< const std::string& >::type FitType(FitTypeSEXP);
    rcpp_result_gen = Rcpp::wrap(InitDF(path, columns, range, FitType));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_StockInit_ProjectVersion", (DL_FUNC) &_StockInit_ProjectVersion, 0},
    {"_StockInit_InitDF", (DL_FUNC) &_StockInit_InitDF, 4},
    {NULL, NULL, 0}
};

RcppExport void R_init_StockInit(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}