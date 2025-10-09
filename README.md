------------------------------------------------------------
---                                                      ---
Omnibenchmark data module (single local SCE dataset)
---                                                      ---
------------------------------------------------------------

   This module materializes a local `.sce.rds` file into OB.
  `{dataset}` resolves to the data module id in the benchmark yaml.
   One dataset = one module (e.g. id: EB_all).

------------------------------------------------------------
Adding new dataset
------------------------------------------------------------
    Put source SCE locally, e.g: 
  /data/home/hochberger/background_benchmark/code/02_benchmark/inputs
  (Any path relative to the benchmark YAML should also work)
  
  Add a new data module with
   - values: ["--source_sce", "path/to/.sce.rds"]
  
  The output stays the same for the whole data stage: 
  outputs:
    - id: data.sce
      path: "{input}/{stage}/{module}/{params}/{dataset}.sce.rds"

------------------------------------------------------------
Outputs created by OB
------------------------------------------------------------
   out/data/EB_all/<params>/EB_all.sce.rds
   out/data/EB_all/<params>/parameters.json
   out/data/EB_all/<params>/EB_all_performance.txt
  
