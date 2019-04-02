# sketchpad.R

df_a <- tibble(a = 1:5,
               b = letters[1:5],
               c = LETTERS[1:5])
df_b <- tibble(a = 1:5,
               b = letters[c(1:4, 23)],
               c = LETTERS[c(1:3, 19, 5)])
df_c <- tibble(a = 1:5,
               b = letters[1:5],
               c = LETTERS[1:5])

df_a
df_b
df_c

identical(df_a, df_a)
identical(df_a, df_b)
identical(df_a, df_c)

for (i in seq_len(nrow(df_a))) {
  for (j in seq_len(ncol(df_a))) {
    if (!identical(df_a[[i, j]], df_b[[i, j]])) {
      cat(paste(i, j, "\n"))
    }
  }
}

compare_dfs <- function(df_1, df_2) {
  df_1_name <- rlang::as_string(rlang::ensym(df_1))
  df_2_name <- rlang::as_string(rlang::ensym(df_2))
  
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

compare_dfs(df_a, df_b)
compare_dfs(df_a, df_c)
