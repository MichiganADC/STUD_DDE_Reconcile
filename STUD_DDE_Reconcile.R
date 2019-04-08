#!/usr/bin/env Rscript

# STUD_DDE_Reconcile.R

# Load Libraries ----

suppressMessages( library(dplyr)   )
suppressMessages( library(readr)   )
suppressMessages( library(stringr) )
suppressMessages( library(crayon)  )

source("STUD_DDE_Reconcile_helpers.R")


# Print initial message
cat("\nComparing files...\n\n")

# Get list of files in source director "Summaries"
path_to_summaries <- "Summaries/"
files_list <- list.files(path_to_summaries)

# Get unique IDs gleaned from filenames
uniq_ids <- files_list %>% 
  str_match("^BH19STUD\\d{5}") %>% 
  unique() %>% 
  as.vector()

# Loop over each unique ID
for (id in uniq_ids) {
  
  # Print STUD ID being processed
  cat(bold(cyan(paste0("STUD ID: ", id, "\n"))))
  
  # Get the files associated with each unique ID
  id_files <- list.files(path_to_summaries, pattern = id)
  
  # Test that there are exactly 2 files associated with each unique ID
  if (length(id_files) == 2L) {
    
    # Get each XLSX file as a list of dfs
    list_dfs1 <- listify_xlsx(id_files[1], path = path_to_summaries)
    list_dfs2 <- listify_xlsx(id_files[2], path = path_to_summaries)
    
    # Compare the list of dfs
    #   - Copy file to `Double_Scored` dir if matching
    if (compare_dfs_list(list_dfs1, list_dfs2) == 1L) {
      file_copy_tf <- file.copy(from = paste0(path_to_summaries, id_files[1]), 
                                to = "Double_Scored",
                                overwrite = FALSE)
      if (file_copy_tf) {
        file.rename(from = paste0("Double_Scored/", id_files[1]),
                    to = paste0("Double_Scored/", id, "_Double_Scored.xlsx"))
      }
    }
    
  } else if (length(id_files) < 2L) {
    
    # Generate too-few-files warning
    warning(paste0("There are fewer than 2 files for STUD ID ", id))
    
  } else if (length(id_files) > 2L) {
    
    # Generate too-many-files warning
    warning(paste0("There are more than 2 files for STUD ID ", id))
    
  } # end if-elseif-elseif
  
} # end for

