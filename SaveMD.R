saveMD <- function(  inputFile, outputType) {
#     encoding <- "ASCII";
      aType <- ifelse( missing(outputType),"html",outputType)
      aType <- ifelse( aType=="html","html_document", aType)
      aType <- ifelse( aType=="pdf", "pdf_document",  aType)
      aType <- ifelse( aType=="word","word_document", aType)
      aType <- ifelse( aType=="all", "all", aType)
#     print(paste("aType:",aType))
      aFile1 <- file.path(getwd(),inputFile);
#     aFile2 <- paste0( "sc", substr(format(Sys.time(), "%y%m%d.%H%M"),2,99), ")_", gsub(".Rmd","",aFile1), "_.md" );
      aFile2 <- paste0( gsub(".Rmd","",aFile1), "_.md" );
#     rmarkdown::render( inputFile=aFile1, encoding=encoding, output_file=aFile2); 
#     rmarkdown::render("README.Rmd", clean=FALSE, output_format = "html_document", quiet=TRUE)
      rmarkdown::render(aFile1, clean=FALSE, output_format = aType, quiet=TRUE)
#     rmarkdown::render(aFile1, clean=FALSE, output_format = aType)
};

myAdd <- function(a,b) { a+b; }

# git2 <- function() { system("git2") }
  git2 <- function() { shell( "git2") }

  
viewHTML <-  function ( aURL ) {
     tempDir <- tempfile()
     dir.create(tempDir)
     htmlFile <- file.path(tempDir, "@tmp.html")
     writeLines(curl( aURL ), htmlFile)
     rstudioapi::viewer(htmlFile)
     }


