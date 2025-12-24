# FITMM: Adaptive Frequency-Aware Multimodal Recommendation via Information-Theoretic Representation Learning

**FITMM** is a frequency-aware information-theoretic framework for multimodal recommendation.

---

## Overview

Multimodal recommendation aims to enhance user preference modeling by leveraging rich item content such as images and text. Yet dominant systems fuse modalities in the spatial domain, obscuring the frequency structure of signals and amplifying misalignment and redundancy. We adopt a spectral information-theoretic view and show that, under an orthogonal transform that approximately block-diagonalizes bandwise covariances, the Gaussian Information Bottleneck objective decouples across frequency bands, providing a principled basis for separate-then-fuse paradigm. Building on this foundation, we propose FITMM, a Frequency-aware Information-Theoretic framework for multimodal recommendation. FITMM constructs graph-enhanced item representations, performs modality-wise spectral decomposition to obtain orthogonal bands, and forms lightweight within-band multimodal components. A residual, task-adaptive gate aggregates bands into the final representation. To control redundancy and improve generalization, we regularize training with a frequency-domain IB term that allocates capacity across bands (Wiener-like shrinkage with shut-off of weak bands). We further introduce a cross-modal spectral consistency loss that aligns modalities within each band. The model is jointly optimized with the standard recommendation loss. Extensive experiments on three real-world datasets demonstrate that FITMM consistently and significantly outperforms advanced baselines.

---

## Installation

We provide two options to set up the conda environment.

### Option A: Install from `environment.yaml` (recommended)

```bash
conda env create -f environment.yaml
conda activate mmrec
```

### Option B: Install from `environment.txt` (explicit spec)

```bash
conda create -n mmrec --file environment.txt
conda activate mmrec
```

> If your environment name is different, replace `mmrec` with your own env name.

---

## Data

Our datasets follow the same format as **MMRec**.  
Please download the datasets and place them under the `data/` directory, then you can run experiments directly.

```text
FITMM/
├── data/
│   ├── dataset_name_1/
│   ├── dataset_name_2/
│   └── dataset_name_3/
├── src/
└── run_exp.sh
```

---

## Running

Run the following script to start training and evaluation:

```bash
sh run_exp.sh
```

---

## Notes and Suggestions

- In principle, the absolute reproduction gap should not exceed **0.2%–0.3%**.
- In our experiments, **User Graph** representation learning provides a stable improvement of about **0.1%–0.2%**.
- If a dataset does **not** provide user embeddings, you can still run FITMM directly. Our code is compatible with this setting, and the reproduction gap should still remain within **0.2%–0.3%** even without the user-graph component.
- For user embeddings, you may construct them using:
  - user profiles (if available),
  - aggregation of multimodal embeddings of interacted items in the training set,
  - embeddings learned from raw item data of the interacted items in the training set.
  This part typically yields an additional **0.1%–0.3%** improvement.

If your reproduction gap exceeds **0.3%**, or you encounter any issues, **please feel free to contact us** at: **weiyangvia@gmail.com, chenyiqun990321@ruc.edu.cn**.  
If there is no response after one week, please contact the authors in reverse order as listed in the paper.

**For any questions or discussions, please contact us first. Thanks for your understanding and interest!**

---

## Citation

If you find this work helpful, please consider citing our paper:

```bibtex
@inproceedings{yang2025fitmm,
  title={FITMM: Adaptive Frequency-Aware Multimodal Recommendation via Information-Theoretic Representation Learning},
  author={Yang, Wei and Zhong, Rui and Chen, Yiqun and Li, Shixuan and Ping, Heng and Lu, Chi and Jiang, Peng},
  booktitle={Proceedings of the 33rd ACM International Conference on Multimedia},
  pages={6193--6202},
  year={2025}
}
```

In addition, our implementation is built upon **MMRec**. Please also cite:

```bibtex
@inproceedings{zhou2023mmrec,
  title={Mmrec: Simplifying multimodal recommendation},
  author={Zhou, Xin},
  booktitle={Proceedings of the 5th ACM International Conference on Multimedia in Asia Workshops},
  pages={1--2},
  year={2023}
}
```
