# STUD_DDE_Reconcile.R

# Load Libraries ----

library(dplyr)
library(readxl)


# Get Data ----

# _ Match

df_cor_evalpre <- 
  read_xlsx("Correct_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Evaluation (Pre)",
            range = "A1:L39",
            col_names = LETTERS[1:which(LETTERS == "L")],
            col_types = "text")
df_cor_evalpost <-
  read_xlsx("Correct_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Evaluation (Post)",
            range = "A1:L39",
            col_names = LETTERS[1:which(LETTERS == "L")],
            col_types = "text")
df_cor_tbpre <-
  read_xlsx("Correct_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Toolbox (Pre)",
            range = "A1:K7",
            col_names = LETTERS[1:which(LETTERS == "K")],
            col_types = "text")
df_cor_tbpost <-
  read_xlsx("Correct_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Toolbox (Post)",
            range = "A1:K7",
            col_names = LETTERS[1:which(LETTERS == "K")],
            col_types = "text")
df_cor_sess1 <-
  read_xlsx("Correct_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 1",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
df_cor_sess2 <- 
  read_xlsx("Correct_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 2",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
df_cor_sess3 <-
  read_xlsx("Correct_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 3",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
df_cor_sess4 <-
  read_xlsx("Correct_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 4",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
dfs_cor1 <- list(df_cor_evalpre  = df_cor_evalpre,
                df_cor_evalpost = df_cor_evalpost,
                df_cor_tbpre    = df_cor_tbpre,
                df_cor_tbpost   = df_cor_tbpost,
                df_cor_sess1    = df_cor_sess1,
                df_cor_sess2    = df_cor_sess2,
                df_cor_sess3    = df_cor_sess3,
                df_cor_sess4    = df_cor_sess4)

df_cor_evalpre <- 
  read_xlsx("Correct_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Evaluation (Pre)",
            range = "A1:L39",
            col_names = LETTERS[1:which(LETTERS == "L")],
            col_types = "text")
df_cor_evalpost <-
  read_xlsx("Correct_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Evaluation (Post)",
            range = "A1:L39",
            col_names = LETTERS[1:which(LETTERS == "L")],
            col_types = "text")
df_cor_tbpre <-
  read_xlsx("Correct_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Toolbox (Pre)",
            range = "A1:K7",
            col_names = LETTERS[1:which(LETTERS == "K")],
            col_types = "text")
df_cor_tbpost <-
  read_xlsx("Correct_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Toolbox (Post)",
            range = "A1:K7",
            col_names = LETTERS[1:which(LETTERS == "K")],
            col_types = "text")
df_cor_sess1 <-
  read_xlsx("Correct_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 1",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
df_cor_sess2 <- 
  read_xlsx("Correct_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 2",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
df_cor_sess3 <-
  read_xlsx("Correct_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 3",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
df_cor_sess4 <-
  read_xlsx("Correct_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 4",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
dfs_cor2 <- list(df_cor_evalpre  = df_cor_evalpre,
                df_cor_evalpost = df_cor_evalpost,
                df_cor_tbpre    = df_cor_tbpre,
                df_cor_tbpost   = df_cor_tbpost,
                df_cor_sess1    = df_cor_sess1,
                df_cor_sess2    = df_cor_sess2,
                df_cor_sess3    = df_cor_sess3,
                df_cor_sess4    = df_cor_sess4)

identical(dfs_cor1, dfs_cor2)

# _ Mismatch

df_inc_evalpre <- 
  read_xlsx("Incorrect_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Evaluation (Pre)",
            range = "A1:L39",
            col_names = LETTERS[1:which(LETTERS == "L")],
            col_types = "text")
df_inc_evalpost <-
  read_xlsx("Incorrect_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Evaluation (Post)",
            range = "A1:L39",
            col_names = LETTERS[1:which(LETTERS == "L")],
            col_types = "text")
df_inc_tbpre <-
  read_xlsx("Incorrect_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Toolbox (Pre)",
            range = "A1:K7",
            col_names = LETTERS[1:which(LETTERS == "K")],
            col_types = "text")
df_inc_tbpost <-
  read_xlsx("Incorrect_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Toolbox (Post)",
            range = "A1:K7",
            col_names = LETTERS[1:which(LETTERS == "K")],
            col_types = "text")
df_inc_sess1 <-
  read_xlsx("Incorrect_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 1",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
df_inc_sess2 <- 
  read_xlsx("Incorrect_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 2",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
df_inc_sess3 <-
  read_xlsx("Incorrect_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 3",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
df_inc_sess4 <-
  read_xlsx("Incorrect_1_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 4",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
dfs_inc1 <- list(df_inc_evalpre  = df_inc_evalpre,
                df_inc_evalpost = df_inc_evalpost,
                df_inc_tbpre    = df_inc_tbpre,
                df_inc_tbpost   = df_inc_tbpost,
                df_inc_sess1    = df_inc_sess1,
                df_inc_sess2    = df_inc_sess2,
                df_inc_sess3    = df_inc_sess3,
                df_inc_sess4    = df_inc_sess4)

df_inc_evalpre <- 
  read_xlsx("Incorrect_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Evaluation (Pre)",
            range = "A1:L39",
            col_names = LETTERS[1:which(LETTERS == "L")],
            col_types = "text")
df_inc_evalpost <-
  read_xlsx("Incorrect_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Evaluation (Post)",
            range = "A1:L39",
            col_names = LETTERS[1:which(LETTERS == "L")],
            col_types = "text")
df_inc_tbpre <-
  read_xlsx("Incorrect_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Toolbox (Pre)",
            range = "A1:K7",
            col_names = LETTERS[1:which(LETTERS == "K")],
            col_types = "text")
df_inc_tbpost <-
  read_xlsx("Incorrect_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Toolbox (Post)",
            range = "A1:K7",
            col_names = LETTERS[1:which(LETTERS == "K")],
            col_types = "text")
df_inc_sess1 <-
  read_xlsx("Incorrect_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 1",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
df_inc_sess2 <- 
  read_xlsx("Incorrect_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 2",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
df_inc_sess3 <-
  read_xlsx("Incorrect_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 3",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
df_inc_sess4 <-
  read_xlsx("Incorrect_2_Neuropsych_Summary_with_Daily_Task_Printouts.xlsx",
            sheet = "Session 4",
            range = "A1:E41",
            col_names = LETTERS[1:which(LETTERS == "E")],
            col_types = "text")
dfs_inc2 <- list(df_inc_evalpre  = df_inc_evalpre,
                df_inc_evalpost = df_inc_evalpost,
                df_inc_tbpre    = df_inc_tbpre,
                df_inc_tbpost   = df_inc_tbpost,
                df_inc_sess1    = df_inc_sess1,
                df_inc_sess2    = df_inc_sess2,
                df_inc_sess3    = df_inc_sess3,
                df_inc_sess4    = df_inc_sess4)

identical(dfs_inc1, dfs_inc2)

names(dfs_inc1)
for (df_name in names(dfs_inc1)) {
  compare_dfs(dfs_inc1[[df_name]], dfs_inc2[[df_name]])
}

compare_dfs(dfs_inc1[["df_inc_evalpre"]], dfs_inc2[["df_inc_evalpre"]])

rlang::sym("blah")
rlang::as_string(rlang::sym("blah"))


compare_dfs <- function(df_1, df_2) {
  df_1_name <- rlang::as_string(rlang::as_string(rlang::ensym(df_1)))
  df_2_name <- rlang::as_string(rlang::as_string(rlang::ensym(df_2)))
  
  if (identical(df_1, df_2)) {
    cat(paste0(df_1_name, " / ", df_2_name, " identical.\n"))
  } else {
    cat(paste0(df_1_name, " / ", df_2_name, " NOT identical.\n"))
    for (i in seq_len(nrow(df_1))) {
      for (j in seq_len(ncol(df_1))) {
        if (!identical(df_1[[i, j]], df_2[[i, j]])) {
          cat(paste0("  Mismatch at ", df_1_name, " / ", df_2_name, ": ",
                     "Row ", i, ", Column ", LETTERS[j], "\n"))
        }
      } # end for j
    } # end for i
  } # end if-else
} 

compare_dfs_list <- function(dfs_list_1, dfs_list_2) {
  dfs_list_1_name <- rlang::as_string(rlang::ensym(dfs_list_1))
  dfs_list_2_name <- rlang::as_string(rlang::ensym(dfs_list_2))
  print(dfs_list_1_name)
  print(dfs_list_2_name)
  
  dfs_list_1_names <- names(dfs_list_1)
  # print(dfs_list_1_names)
}

compare_dfs_list(dfs_inc1, dfs_inc2)












