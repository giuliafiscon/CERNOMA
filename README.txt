- Open code/script/input/config.R file to set the input files and parameters.
- Set your own wrking directory in code/main.R file
- Launch the code/main.R file to run the code

Description of code/input folder: 
- Homo_sapiens_circ.txt (downloaded from circFunBase 
http://bis.zju.edu.cn/CircFunBase/help.php#download)

- /dataset (example dataset):
/BRCA:

/matrix:
1) matrix_RNAseq_BRCA (RNA matrix downloaded from TCGA, for memory reason, only the first 998 rows are present as example)
2) matrix_miRNAseq_BRCA (miRNA matrix downloaded from TCGA)

/list: 
List_Normal_BRCA_RNAseq_4wayData.txt (list of matched normal samples of RNA matrix)
List_Normal_BRCA_miRNAseq_4wayData.txt (list of matched normal samples of miRNA matrix)
List_Tumor_BRCA_RNAseq_4wayData.txt (list of matched normal samples of RNA matrix)
List_Tumor_BRCA_miRNAseq_4wayData.txt (list of matched normal samples of miRNA matrix)