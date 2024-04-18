

loaded_model <- readRDS(here::here("models/linear_model.rds"))
model_summary <- capture.output(summary(loaded_model))
writeLines(model_summary, "model_summary.txt")
