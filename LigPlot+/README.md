# LigPlot+ Batch Pipeline (Simplified Guide)

This guide explains how to run the LigPlot+ batch processing workflow using a prepared list of PDB IDs and chain IDs.

---

##  Files required to run the automation script
- An excel sheet with a list of PDB ids with their chain ids in the following format `PDBid_Chainid`
- Run the `PdbID_ChainID_Extraction.ipynb` file which will return a `.csv` file named as `pdb_chain_list` containing column seperated PDB IDs and Chain IDs
- Scripts: `import_os.py` and `dimpyplot.py`
- LigPlot+ executable folder for `linux_64`
---

## 🔧 Step 1: Set up the virtual environment

Set up the virtual environment
```bash
python3 -m venv venv
source venv/bin/activate
```

Install pandas or any other necessary libraries in the environment using

```bash
pip install pandas
```

## Editing paths in the script

Open import_os.py and make sure the following variables match your system paths:

```bash
csv_file = "pdb_chain_list.csv"
pdb_dir = "/home/<your-username>/ligplot/pdbs"
output_dir = "/home/<your-username>/ligplot/output"
ligplus_root = "/home/<your-username>/LigPlus"
ligplot_plus_path = os.path.join(ligplus_root, "lib/exe_linux64")
components_path = os.path.join(ligplus_root, "components.cif")
dimpyplot_script = "dimpyplot.py"
```

Make sure the directories pdb_dir and output_dir exist before running the pipeline.

### Run the pipeline

Inside the virtual environment, run:

```bash
python import_os.py
```

This will:

- Download PDB files for the entries in your CSV

- Call dimpyplot.py to process each entry

- Move .drw output files to the output folder

- Save ligand names in a summary CSV'

### Output overview

For ligplot/output
- .drw or .txt ligand interaction plots

- ligand_names.csv with detected ligand residues

For ligplot/pdbs

- Raw .pdb files for each ID

- Intermediate .hhb, .nnb, .ligplot.bonds files