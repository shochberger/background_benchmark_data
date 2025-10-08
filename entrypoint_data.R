#!/usr/bin/env Rscript

library(argparse)

p <- ArgumentParser(description = "Materialize SCE for OB (local files)")
p$add_argument("--output_dir", "-o", required=TRUE, help = "Output directory provided by OB")
p$add_argument("--name", "-n", help = "Name of this module")
p$add_argument("--dataset_name", required = TRUE)
p$add_argument("--source_sce", required = TRUE, help = "Path to source SCE file (local inputs/*.sce.rds")
args <- p$parse_args()


# Ensure output directory exists
dir.create(args$output_dir, showWarnings=FALSE, recursive=TRUE)

# OB expects the dataset in this path
out <- file.path(args$output_dir, paste0(args$dataset_name, ".sce.rds"))


# Validate and copy
if (!file.exists(args$source_sce)) {
  stop("Source SCE not found: ", args$source_sce)
}

copy_success <- file.copy(args$source_sce, out, overwrite=TRUE)
if (!copy_success) stop("Copy failed")

cat(sprintf("[data] Provided %s -> %s\n", args$source_sce, out))
