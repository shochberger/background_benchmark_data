#!/usr/bin/env Rscript

library(argparse)

p <- ArgumentParser(description = "Materialize EB_all SCE for OB")
p$add_argument("--output_dir", "-o", required=TRUE, help = "Output directory provided by OB")
p$add_argument("--name", "-n", required=TRUE, help = "Dataset identifier")
p$add_argument("--source_sce", required = TRUE, help = "Path to source SCE file (local inputs/EB_all.sce.rds")
args <- p$parse_args()


# Ensure OB´s output directory exists
dir.create(args$output_dir, showWarnings=FALSE, recursive=TRUE)
# OB expects the dataset in this path (defined by YAML outputs)
out <- file.path(args$output_dir, paste0(args$name, ".sce.rds"))

# Copy source file into provenance tree
if (!file.exists(args$source_sce)) {
  stop("Source SCE not found: ", args$source_sce)
}
ok <- file.copy(args$source_sce, out, overwrite=TRUE)
if (!ok) stop("Copy failed")

cat(sprintf("[EB_all data] Provided %s -> %s\n", args$source_sce, out))
