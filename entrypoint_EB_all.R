#!/usr/bin/env Rscript

library(argparse)

p <- ArgumentParser()
p$add_argument("--output_dir", "-o", required=TRUE)
p$add_argument("--name", "-n", required=TRUE)     # z.B. EB_all
args <- p$parse_args()

# Direct path to SCE
source_file <- "/data/home/hochberger/background_benchmark/code/02_benchmark/data/EB_all/default/EB_all.sce.rds"

# Target path (OB replaces --output_dir and --name)
dir.create(args$output_dir, showWarnings=FALSE, recursive=TRUE)
out <- file.path(args$output_dir, paste0(args$name, ".sce.rds"))

if (!file.exists(source_file)) {
  stop("Source SCE not found: ", source_file)
}
ok <- file.copy(source_file, out, overwrite=TRUE)
if (!ok) stop("Copy failed")

cat(sprintf("[EB_all data] Provided %s -> %s\n", source_file, out))
