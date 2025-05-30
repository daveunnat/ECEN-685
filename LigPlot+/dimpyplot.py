#!/usr/bin/env python3

import subprocess
import os
import argparse

parser = argparse.ArgumentParser(description='dimplot with python3', formatter_class=argparse.ArgumentDefaultsHelpFormatter)

### LigPlot+ environment
parser.add_argument('--LigPlus_path', type=str, default='/Users/yuyuan/bin/LigPlus', help='Define LigPlot+ environment - Location of LigPlus folder')
parser.add_argument('--components_cif', type=str, default='/Users/yuyuan/bin/LigPlus/data/components.cif', help='Define LigPlot+ environment - Location of components.cif')
parser.add_argument('--ligplot_plus', type=str, default='/Users/yuyuan/bin/LigPlus/lib/exe_mac64/', help='Define LigPlot+ environment - Location of LigPlus executable folder')

## Define working directory, chains and which to plot
parser.add_argument('--wkdir', type=str, default='./test_pdb', help='working directory')
parser.add_argument('--chain1', type=str, default='A', help='Define chains for analysis - chain1')
# parser.add_argument('--chain2', type=str, default='B', help='Define chains for analysis - chain2')
parser.add_argument('--ligplot', dest='ligplot', action='store_true', help='include original ligplot and related files')
parser.add_argument('--dimplot', dest='dimplot', action='store_true', help='include original dimplot and related files')
parser.add_argument('--fullreport', dest='full', action='store_true', help='report both dimplot and ligplot')

parser.set_defaults(ligplot=False, dimplot=False, full=False)
args = parser.parse_args()

# determine what to plot
if args.full:
	args.ligplot=True
	args.dimplot=True


### Define LigPlot+ environment
LigPlus_path = args.LigPlus_path
components_cif = args.components_cif
ligplot_plus = args.ligplot_plus 

### Define the chains you want to process here
wkdir = args.wkdir
chain1 = args.chain1
# chain2 = args.chain2

def dimplot(filename):
	"""Emulates running the LigPlot+ DIMPLOT algorithm. Rewriting as a CLI to allow for a batch mode."""
	file_prefix = filename.strip('.pdb')[0]

	# Run HBadd
	hbadd_path = os.path.join(ligplot_plus, "hbadd")
	hbplus_path = os.path.join(ligplot_plus, "hbplus")
	dimer_path = os.path.join(ligplot_plus, "dimer")
	dimhtml_path = os.path.join(ligplot_plus, "dimhtml")
	ligplot_path = os.path.join(ligplot_plus, "ligplot")
	subprocess.check_call([hbadd_path, filename, components_cif, '-wkdir', './'], shell=False)



	# Run HBplus
	try:
		subprocess.check_call([hbplus_path, '-L', '-h', '2.90', '-d', '3.90', '-N', filename, '-wkdir', './'], shell=False)
	except subprocess.CalledProcessError:
		print(f"⚠️ hbplus failed on {filename} (2.90 cutoff) — skipping structure.")
		return


	# Run HBplus again
	try:
		subprocess.check_call([hbplus_path, '-L', '-h', '2.70', '-d', '3.35', filename, '-wkdir', './'], shell=False)
	except subprocess.CalledProcessError:
		print(f"⚠️ hbplus failed on {filename} (2.70 cutoff) — skipping structure.")
		return



	if args.dimplot:
		# Run dimer
		try:
			subprocess.check_call([dimer_path, filename, chain1, chain1], shell=False)
		except subprocess.CalledProcessError:
			print(f"⚠️ dimer failed for {filename} ({chain1}-{chain1}) — skipping interaction.")
			return



		# Run dimhtml
		try:
			subprocess.check_call([dimhtml_path, 'none', '-dimp', '-dir', './', '-flip', '-ctype', '1'], shell=False)
		except subprocess.CalledProcessError:
			print(f"⚠️ dimhtml failed on {filename}, possibly due to alignment path length. Skipping HTML generation.")
			return

	if args.ligplot:
		# Run ligplot
		ligplot_prm = os.path.join(LigPlus_path, 'lib/params/dimplot.prm')

		if os.path.exists("dimplot.pdb") and os.path.getsize("dimplot.pdb") > 0:
			try:
				subprocess.check_call([
					ligplot_path, 'dimplot.pdb', '-wkdir', './',
					'-prm', ligplot_prm, '-ctype', '1'
				], shell=False)
			except subprocess.CalledProcessError:
				print(f"⚠️ ligplot failed for dimplot.pdb — skipping.")
		else:
			print(f"⚠️ Skipping LigPlot+: dimplot.pdb not found or empty.")



	# Rename trashy files
	files_to_rename = [_ for _ in os.listdir('.') if
		'dimplot.' in _[0:8] or 'ligplot.' in _[0:8]]

	for file_to_rename in files_to_rename:
		subprocess.check_call([
			'mv',
			file_to_rename,
			f"{filename.split('.pdb')[0]}.{file_to_rename}"])

def main():
	"""Main function."""
	# Get list of pdb files in the directory
	pdb_files = [_ for _ in os.listdir(wkdir) if
 		(_[-4:] == '.pdb') and ('dimplot' not in _) and ('ligplot' not in _)]
	print(pdb_files)
	for pdb_file in pdb_files:
		os.chdir(wkdir)
		dimplot(filename=pdb_file)
	quit()

if __name__ == '__main__':
	try:
		main()
	except KeyboardInterrupt:
		print('\n\nGoodbye!\n\n')
