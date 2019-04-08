# STUD_DDE_Reconcile_helpers.R

suppressMessages( library(readxl) )
suppressMessages( library(crayon) )
suppressMessages( library(rlang)  )

# Convert XLSX file to a list of worksheet dfs
listify_xlsx <- function(file, path = NULL) {
  # Create a df for each pertinent worksheet
  df_evalpre <-
    read_xlsx(paste0(path, file),
              sheet = "Evaluation (Pre)",
              range = "A1:L39",
              col_names = LETTERS[1:which(LETTERS == "L")],
              col_types = "text")
  df_evalpost <-
    read_xlsx(paste0(path, file),
              sheet = "Evaluation (Post)",
              range = "A1:L39",
              col_names = LETTERS[1:which(LETTERS == "L")],
              col_types = "text")
  df_tbpre <-
    read_xlsx(paste0(path, file),
              sheet = "Toolbox (Pre)",
              range = "A1:K7",
              col_names = LETTERS[1:which(LETTERS == "K")],
              col_types = "text")
  df_tbpost <-
    read_xlsx(paste0(path, file),
              sheet = "Toolbox (Post)",
              range = "A1:K7",
              col_names = LETTERS[1:which(LETTERS == "K")],
              col_types = "text")
  df_sess1 <-
    read_xlsx(paste0(path, file),
              sheet = "Session 1",
              range = "A1:E41",
              col_names = LETTERS[1:which(LETTERS == "E")],
              col_types = "text")
  df_sess2 <-
    read_xlsx(paste0(path, file),
              sheet = "Session 2",
              range = "A1:E41",
              col_names = LETTERS[1:which(LETTERS == "E")],
              col_types = "text")
  df_sess3 <-
    read_xlsx(paste0(path, file),
              sheet = "Session 3",
              range = "A1:E41",
              col_names = LETTERS[1:which(LETTERS == "E")],
              col_types = "text")
  df_sess4 <-
    read_xlsx(paste0(path, file),
              sheet = "Session 4",
              range = "A1:E41",
              col_names = LETTERS[1:which(LETTERS == "E")],
              col_types = "text")
  # Return all dfs as a list
  list("file"              = file, 
       "Evalution (Pre)"   = df_evalpre,
       "Evaluation (Post)" = df_evalpost,
       "Toolbox (Pre)"     = df_tbpre,
       "Toolbox (Post)"    = df_tbpost,
       "Session 1"         = df_sess1,
       "Session 2"         = df_sess2,
       "Session 3"         = df_sess3,
       "Session 4"         = df_sess4)
}


# Custom comparison of lists containing worksheet dfs
compare_dfs_list <- function(dfs_list_1, dfs_list_2) {
  
  dfs_list_1_name <- as_string(ensym(dfs_list_1))
  dfs_list_2_name <- as_string(ensym(dfs_list_2))
  
  dfs_list_1_names <- names(dfs_list_1)[-1]
  dfs_list_2_names <- names(dfs_list_2)[-1]
  
  cat(paste0(dfs_list_1[["file"]], " / \n", dfs_list_2[["file"]], "\n"))
  
  # if spreadsheet lists are identical
  if (identical(dfs_list_1[-1], dfs_list_2[-1])) {
    
    # Print happy match message
    cat(bold(green(paste0("  Speadsheets match! \U1F197\n\n"))))
    
    # If match, return 1
    return(1L)
    
  } else { # spreadsheet lists aren't identical
    
    # iterate over each worksheet df in the spreadsheet list
    for (name in dfs_list_1_names) {
      
      # if a worksheet df isn't identical
      if (!identical(dfs_list_1[[name]], dfs_list_2[[name]])) {
        
        # Print mismatch message
        cat(bold(red(paste0("  Mismatch\U00A1 "))))
        cat(paste0("\U274C\n", "    in ", bold(underline(name)), "\n"))
        
        # Print location of mismatch between two spreadsheet dfs
        for (i in seq_len(nrow(dfs_list_1[[name]]))) {
          for (j in seq_len(ncol(dfs_list_1[[name]]))) {
            if (!identical(dfs_list_1[[name]][[i, j]], 
                           dfs_list_2[[name]][[i, j]])) {
              cat(paste0("    at Row ", bold(underline(i)), 
                         " Column ", bold(underline(LETTERS[j])), "\n"))
            }
          } # end for (j ...)
        } # end for (i ...)
      } # end if
    } # end for (name ...)
    cat("\n")
    
    return(0L)
    
  } # end if-else
  
}

