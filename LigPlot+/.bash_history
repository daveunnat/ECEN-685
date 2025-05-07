ls
mkdir -p ~/ligplot
cd ~/ligplot
ls
cp /mnt/C:\LigPlus.zip
cp /mnt/C:/LigPlus.zip

ls
tar -xvzf LigPlus.zip
unzip LigPlux.zip
sudo apt install unzip
unzip LigPlus.zip
ls
cd LigPlus/
ls
#!/bin/bash
CSV_FILE=~/pdb_chain_list.csv
OUTPUT_DIR=~/ligplot_output
mkdir -p $OUTPUT_DIR
cd ~/ligplot/ligplot+*
while IFS=, read -r pdb chain; do     if [[ "$pdb" != "PDB_ID" ]]; then         echo "Running LigPlot+ on $pdb chain $chain";         ./ligplot.sh -pdb $pdb -ch $chain -noxwin -o $OUTPUT_DIR/${pdb}_${chain};     fi; done < "$CSV_FILE"
cp /mnt/c/Users/daveu/Downloads/pdb_chain_list.csv .
ls
#!/bin/bash
CSV_FILE=~/pdb_chain_list.csv
OUTPUT_DIR=~/ligplot_output
mkdir -p $OUTPUT_DIR
cd ~/ligplot/ligplot+*
while IFS=, read -r pdb chain; do     if [[ "$pdb" != "PDB_ID" ]]; then         echo "Running LigPlot+ on $pdb chain $chain";         ./ligplot.sh -pdb $pdb -ch $chain -noxwin -o $OUTPUT_DIR/${pdb}_${chain};     fi; done < "$CSV_FILE"
clear
#!/bin/bash
CSV_FILE=~/pdb_chain_list.csv
OUTPUT_DIR=~/ligplot_output
mkdir -p $OUTPUT_DIR
cd ~/ligplot/LigPlus
while IFS=, read -r pdb chain; do     if [[ "$pdb" != "PDB_ID" ]]; then         echo "Running LigPlot+ on $pdb chain $chain";         ./ligplot.sh -pdb $pdb -ch $chain -noxwin -o $OUTPUT_DIR/${pdb}_${chain};     fi; done < "$CSV_FILE"
cd ..
cd ..'
cd ..
cp /mnt/c/Users/daveu/Downloads/pdb_chain_list.csv .
ls
cd ligplot_output/
ls
cd ..
cd ligplot
cd LigPlus/
ls
#!/bin/bash
CSV_FILE=~/pdb_chain_list.csv
OUTPUT_DIR=~/ligplot_output
mkdir -p $OUTPUT_DIR
cd ~/ligplot/ligplot+*
while IFS=, read -r pdb chain; do     if [[ "$pdb" != "PDB_ID" ]]; then         echo "Running LigPlot+ on $pdb chain $chain";         ./ligplot.sh -pdb $pdb -ch $chain -noxwin -o $OUTPUT_DIR/${pdb}_${chain};     fi; done < "$CSV_FILE"
clear
ssh unnatdave_55@ecen-4y451q2.engr.tamu.edu
ls
sudo apt update
sudo apt install unzip openjdk-11-jre wget -y
ls
cd ligplot
ls
cd LigPlus/
nano run_ligplot_batch.sh
ls
chmod +x run_ligplot_batch.sh
./run_ligplot_batch.sh
ls | grep ligplot.sh
ls
clear
ls
rm -r ligplot
ls
rm -r ligplot_output/
ls
sudo apt update && sudo apt install unzip default-jre wget -y
mkdir -p ~/ligplot
cd ~/ligplot
wget https://www.ebi.ac.uk/thornton-srv/software/LigPlus/download/ligplot_2_2_6.tar.gz
tar -xvzf ligplot_2_2_6.tar.gz
sudo apt update
sudo apt install unzip default-jre wget -y
cp /mnt/c/Users/daveu/Downloads/LigPlus.zip .
ls
cd ligplot/
ls
cd ..
rm -r ligplot/
ls
unzip LigPlus.zip 
ls
cd LigPlus/
ls
cd lib/
ls
cd exe_linux64/
ls
chmod +x ligplot
ls
./ligplot --help
./ligplot
pwd
cd ..
ls
cd ..
ls
cd LigPlus/
ls
cd LigPlus/
ls
cd lib/
ls
cd ../
cd LigPlus/
ls
cd ..
ls
cd LigPlus/
ls
java -cp ~/LigPlus -jar ~/LigPlus/LigPlus.jar
cd ..
ls
cd LigPlus/
ls
cp /mnt/c/Users/daveu/Downloads/components.cif .
ls
cd ..
ls
cp /mnt/c/Users/daveu/Desktop/import_os.py .
ls
rm import_os.py 
ls
clear
cd LigPlus/
ls
cd ..
cp /mnt/c/Users/daveu/Desktop/import_os.py .
ls
python3 import_os.py
sudo apt update && sudo apt install python3-pip -y
pip3 install pandas
sudo apt update
sudo apt install python3.12-venv -y
python3 -m venv venv
source venv/bin/activate
pip install pandas
python import_os.py 
deactivate
code .
python3 -m venv venv
source venv/bin/activate
python import_os.py 
deactivate
ls
cd ligplot/
ls
cd pdbs/
ls
cd ..
ls
cd ..
ls
nano import_os.py 
/home/daveu/LigPlus/lib/exe_linux64/ligplot   -pdb /home/daveu/ligplot/pdbs/4FWH.pdb   -chain A   -components /home/daveu/LigPlus/components.cif   -noxwin   -o /home/daveu/ligplot/output/4FWH_A
code .
source venv/bin/activate
python import_os.py 
deactivate
ls
cd ligplot/
cd pdbs/
ls
pwd
cd ..
source venv/bin/activate
python import_os.py 
deactivate
java -cp ~/LigPlus -jar ~/LigPlus/LigPlus.jar   -pdb ~/ligplot/pdbs/4FWH.pdb   -chain A   -components ~/LigPlus/components.cif   -noxwin   -o ~/ligplot/output/4FWH_A
code .
cp /mnt/c/Users/daveu/Downloads/dimpyplot.py .
ls
source venv/bin/activate
python import_os.py 
ls
code .
source venv/bin/activate
python import_os.py 
deactivate
ls
cd ligplot/
ls
cd ..
cd LigPlus/
ls
cd lib/
cd exe_linux64/
ls
cd ..
ls
code .
source venv/bin/activate
python import_os.py 
code .
source venv/bin/activate
python import_os.py 
deactivate
ls
cd ligplot/
ls
cd output/
ls
cd ..
code .
source venv/bin/activate
python import_os.py 
ls
cd ligplot/
ls
cd output/
ls
cd ..
code .
source venv/bin/activate
python import_os.py 
deactivate
ls
cd ligplot/
ls
cd output/
ls
cd ..
source venv/bin/activate
code .
python import_os.py 
source venv/bin/activate
python import_os.py 
code .
deactivate
source venv/bin/activate
python import_os.py 
deactivate
ls
cd ligplot/
ls
cd output/
ls
cd ..
ls
cd pdbs/
ls
ls *.txt
ls *.pdb
code .
cd ..
ls
code .
source venv/bin/activate
python import_os.py 
deactivate
ls ~/ligplot/pdbs/*.pdb | wc -l
ls ~/ligplot/output/*.txt | wc -l
cd ligplot/output/
ls
zip /mnt/d/lig_outputs.zip ~/ligplot/output/*
sudo apt install zip
zip /mnt/d/lig_outputs.zip ~/ligplot/output/*
cd ligplot/pdbs/
ls
cd ..
mkdir -p ~/ligplot/bonds
ls
cd ligplot/
ls
cp ~/ligplot/pdbs/*.ligplot.bonds ~/ligplot/bonds/
cd bonds/
ls
ls ~/ligplot/bonds/*.ligplot.bonds | wc -l
zip -j /mnt/d/ligplot_bonds.zip ~/ligplot/bonds/*
cd ..
code .
cd ligplot/output/
ls ~/ligplot/output/*.txt | wc -l
clear
ls
grep -i '1A5S' pdb_chain_list.csv > one_pdb.csv
echo "PDB_ID,CHAIN_ID" | cat - one_pdb.csv > temp.csv && mv temp.csv one_pdb.csv
python3 run_dimpyplot_batch.py
grep -i '1A5S' pdb_chain_list.csv > one_pdb.csv
echo "PDB_ID,CHAIN_ID" | cat - one_pdb.csv > temp.csv && mv temp.csv one_pdb.csv
python3 import_os.py
source venv/bin/activate
grep -i '1A5S' pdb_chain_list.csv > one_pdb.csv
echo "PDB_ID,CHAIN_ID" | cat - one_pdb.csv > temp.csv && mv temp.csv one_pdb.csv
python3 run_dimpyplot_batch.py
grep -i '1A5S' pdb_chain_list.csv > one_pdb.csv
echo "PDB_ID,CHAIN_ID" | cat - one_pdb.csv > temp.csv && mv temp.csv one_pdb.csv
python3 import_os.py
clear
source venv/bin/activate
deactivate
code .
ls
ls one_pdb.csv 
cat one_pdb.csv 
cp ~dimpyplot.py ~import_os.py /mnt/c/Users/daveu/Desktop/
cp dimpyplot.py import_os.py /mnt/c/Users/daveu/Desktop/
ls
source venv/bin/activate
python3 import_os.py
deactivate
ls
cd ligplot/
ls
mkdir pdbs_1a5s
ls
ls pdbs_1a5s/
cd ..
ls
source venv/bin/activate
python3 import_os.py
code .
deactivate
ls
cd ligplot/
ls
mkdir output_test_pdb
source venv/bin/activate
cd ..
source venv/bin/activate
python3 import_os.py
deactivate
cd ligplot/
ls
cd output_test_pdb/
ls
cp 1A5S.ligplot.drw /mnt/c/Users/daveu/Desktop/ .
cp 1A5S.ligplot.drw /mnt/c/Users/daveu/Desktop .
cp 1A5S.ligplot.drw /mnt/c/Users/daveu/Desktop
cd ..
ls
rm pdbs_1a5s/
rm -r pdbs_1a5s/
ls
mkdir pdbs_test
cd ..
source venv/bin/activate
python3 import_os.py
deactivate
cd ligplot/
ls
cd pdbs_test/
l
ls
code .
cd ..
code .
ls
rm -r one_pdb.csv 
ls
cp /mnt/c/Users/daveu/Downloads/pdb_chain_test.csv .
ls
code .
source venv/bin/activate
python3 import_os.py
deactivate 
cd ligplot/
ls
cd ..
cp dimpyplot.py /mnt/c/Users/daveu/Desktop/
code .
source venv/bin/activate
python3 import_os.py
deactivate
cat /home/daveu/ligplot/pdbs_4uxj/4UXJ.ligplot.bonds
cd ligplot/
ls
cd ..
ls
code .
cd ligplot/output_test_pdb/
ls
cd ..
cd pdbs_test/
ls
cd ..
cat /home/daveu/ligplot/pdbs_test/4UXJ.ligplot.bonds
source venv/bin/activate
python3 import_os.py
deactivate
ls
cd ligplot/
ls
cd ..
cd LigPlus/
ls
cat components.cif 
cp components.cif /mnt/c/Users/daveu/Desktop/
cd ..
code .
source venv/bin/activate
python3 import_os.py
deactivate
code .
