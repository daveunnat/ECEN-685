import os
import subprocess
import pandas as pd
import urllib.request
import shutil

# === CONFIGURATION ===
csv_file = "pdb_chain_list.csv"
pdb_dir = "/home/daveu/ligplot/pdbs"
ligplus_root = "/home/daveu/LigPlus"
ligplot_plus_path = os.path.join(ligplus_root, "lib/exe_linux64")
components_path = os.path.join(ligplus_root, "components.cif")
dimpyplot_script = "dimpyplot.py"
output_dir = "/home/daveu/ligplot/output"
ligand_log_file = "/home/daveu/ligplot/ligand_names.csv"

# === SETUP ===
os.makedirs(pdb_dir, exist_ok=True)
os.makedirs(output_dir, exist_ok=True)
df = pd.read_csv(csv_file).dropna().drop_duplicates()

# df = df[df["PDB_ID"].str.upper() == "4UXJ"]


# === Helper: Download .pdb from RCSB ===
def download_pdb(pdb_id, dest_dir):
    pdb_id = pdb_id.lower()
    url = f"https://files.rcsb.org/download/{pdb_id}.pdb"
    dest_path = os.path.join(dest_dir, f"{pdb_id.upper()}.pdb")
    if os.path.exists(dest_path):
        print(f"⏭️  Already exists: {pdb_id}")
        return dest_path
    try:
        print(f"⬇️  Downloading {pdb_id}...")
        urllib.request.urlretrieve(url, dest_path)
        return dest_path
    except Exception as e:
        print(f"❌ Failed to download {pdb_id}: {e}")
        return None

# === Step 1: Download All PDBs ===
chain1 = None
for _, row in df.iterrows():
    pdb = row["PDB_ID"].upper()
    chain1 = str(row["CHAIN_ID"]).strip().upper()
    download_pdb(pdb, pdb_dir)

# === Step 2: Run dimpyplot.py on the PDB folder ===
print("\n▶️ Running dimpyplot.py on all PDBs in batch...")

cmd = [
    "python3", dimpyplot_script,
    "--wkdir", pdb_dir,
    "--ligplot",
    "--dimplot",
    "--LigPlus_path", ligplus_root,
    "--components_cif", components_path,
    "--ligplot_plus", ligplot_plus_path
]

if chain1:
    cmd.extend(["--chain1", chain1])

try:
    subprocess.run(cmd, check=True)
    print("✅ dimpyplot.py finished successfully.")

    ligand_names = []

    # === Step 3: Move .drw files to output_dir without renaming ===
    for file in os.listdir(pdb_dir):
        if file.endswith(".drw"):
            src = os.path.join(pdb_dir, file)
            dst = os.path.join(output_dir, file)
            try:
                shutil.move(src, dst)
                print(f"📄 Moved: {file} → {output_dir}")

                # === Step 4: Extract ligand name from .drw file (fallback to .ligplot.bonds) ===
                ligand_found = False
                with open(dst, 'r') as f:
                    for line in f:
                        if line.strip().startswith("Ligand:"):
                            ligand = line.strip().split()[1]
                            ligand_names.append({"file": file, "ligand": ligand, "source": "drw"})
                            ligand_found = True
                            break

                if not ligand_found:
                    # Attempt fallback to .ligplot.bonds
                    bonds_file = file.replace(".drw", ".ligplot.bonds")
                    bonds_path = os.path.join(pdb_dir, bonds_file)
                    if os.path.exists(bonds_path):
                        with open(bonds_path, 'r') as bf:
                            for line in bf:
                                parts = line.strip().split()
                                if len(parts) >= 1:
                                    ligand = parts[0]
                                    ligand_names.append({"file": file, "ligand": ligand, "source": "bonds"})
                                    break

            except Exception as e:
                print(f"❌ Failed to move or parse {file}: {e}")

    # === Step 5: Save ligand names to CSV ===
    if ligand_names:
        pd.DataFrame(ligand_names).to_csv(ligand_log_file, index=False)
        print(f"🧪 Ligand names saved to {ligand_log_file}")

except subprocess.CalledProcessError as e:
    print(f"❌ Error running dimpyplot.py: {e}")
