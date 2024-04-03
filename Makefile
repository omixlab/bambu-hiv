MAKEFLAGS=-j 2

setup:
	@conda env create --file environment.yml || conda env update --file environment.yml

dirs:
	@mkdir -p data/raw
	@mkdir -p data/preprocessing
	@mkdir -p data/train
	@mkdir -p data/validate

all:
	@bash run_bambu.sh pubchem_ids.txt descriptors
	@bash run_bambu.sh pubchem_ids.txt morgan-1024
	@bash run_bambu.sh pubchem_ids.txt morgan-2048
	@bash run_bambu.sh pubchem_ids.txt mol2vec

download: dirs
	@bash scripts/run_bambu_download.sh pubchem_ids.txt

preprocessing: dirs
	@bash scripts/run_bambu_preprocess.sh pubchem_ids.txt

training: dirs
	@bash scripts/run_bambu_train.sh pubchem_ids.txt

validation: dirs
	@bash scripts/run_bambu_validate.sh pubchem_ids.txt

server:
	@bambu-server \
		--host 0.0.0.0 \
		--port 8085 \
		--config configuration.json

worker:
	@bambu-worker

deploy: server worker
