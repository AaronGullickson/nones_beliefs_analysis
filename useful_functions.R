## useful_functions.R

#Functions for the project that can be shared across scripts

#get the predicted probabilities for cumulative logit models given a matrix of predicted values
get.fitted.probs <- function(cmodel, data.predict, outcome.names=NULl) {
  clodds <- predict(cmodel, data.predict)
  codds <- exp(clodds)
  cprob <- codds/(1+codds)
  probs <- matrix(NA, nrow(cprob), ncol(cprob)+1)
  probs[,ncol(probs)] <- cprob[,ncol(cprob)]
  for(i in ncol(cprob):2) {
    probs[,i] <- cprob[,i-1]-cprob[,i]
  }
  probs[,1] <- 1-cprob[,1]
  if(!is.null(outcome.names)) {
    colnames(probs) <- outcome.names
  }
  return(probs)
}


#produce a stargazer table from the VGLM models 
vglm.stargazer <- function(models, sg.type="text", sg.title="", ncat=3) {
  #first extract all the stuff we want from the actual models
  coef.tables <- lapply(models, function(model) {coef(summary(model))})
  coefs <- lapply(coef.tables, function(x) {x[,1]})
  se <- lapply(coef.tables, function(x) {x[,2]})
  zstat <- lapply(coef.tables, function(x) {x[,3]})
  pvalue <- lapply(coef.tables, function(x) {x[,4]})
  
  #get the summary statistics for the models
  N <- sapply(models, function(model) {length(model@fitted.values[,1])})
  bic <- sapply(models, BIC)
  summaryStats <- list(c("Observations",N),c("BIC",round(bic,1)))
    
  #OK, this is a total hack but I am going to create a random OLS regression with the right number of 
  #parameters and names to match the most complex model. This is not robust to more complex models
  #without internal adjustements to the code
  for(i in 1:length(coefs)) {
    names(coefs[[i]]) <- names(se[[i]]) <- names(zstat[[i]]) <- names(pvalue[[i]]) <- gsub(":", "_", names(coefs[[i]]))
  }
  
  formulas <- lapply(coefs, function(x) {paste("dv",paste(names(x)[-c(1:(ncat-1))],collapse="+"),sep="~")})
  
  #now create fake data
  fake.data <- data.frame(dv=rnorm(100),
                          year.centered=rnorm(100),
                          "year.centered_1"=rnorm(100),
                          "year.centered_2"=rnorm(100),
                          year.spline=rnorm(100),
                          "year.spline_1"=rnorm(100),
                          "year.spline_2"=rnorm(100),
                          nonesNone=rnorm(100),
                          "nonesNone_1"=rnorm(100),
                          "nonesNone_2"=rnorm(100),
                          "nonesNone_year.centered"=rnorm(100),
                          "nonesNone_year.centered_1"=rnorm(100),
                          "nonesNone_year.centered_2"=rnorm(100),
                          "nonesNone_year.spline"=rnorm(100),
                          "nonesNone_year.spline_1"=rnorm(100),
                          "nonesNone_year.spline_2"=rnorm(100))
  
  #now run simple OLS regression models so I have some base models for stargazer
  models.ols  <- lapply(formulas, function(x) {lm(x, data=fake.data)})
  
  stargazer(models.ols, type=sg.type, coef=coefs, se=se, t=zstat, p=pvalue,
            keep=c("year","none"), 
            omit.stat=c("n", "rsq","adj.rsq","ser","f"),
            star.cutoffs=c(0.05,0.01,0.001),
            add.lines=summaryStats,
            dep.var.labels.include = FALSE,
            dep.var.caption="",
            title=sg.title)
}
