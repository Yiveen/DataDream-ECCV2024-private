## DataDream: Few-shot Guided Dataset Generation

Jae Myung Kim<sup>1*</sup>, Jessica Bader<sup>2,3*</sup>, Stephan Alaniz<sup>2</sup>, Cordelia Schmid<sup>4</sup>, Zeynep Akata<sup>2,3</sup>

<sub>\* Equal contribution</sub>

<sup>1</sup> <sub>University of T&uuml;bingen</sub>  <sup>2</sup> <sub>Helmholtz Munich</sub>   <sup>3</sup> <sub>TUM</sub>   <sup>4</sup> <sub>Inria/Google</sub>  


### Abstract

While text-to-image diffusion models have been shown to achieve state-of-the-art results in image synthesis, they have yet to prove their effectiveness in downstream applications. Previous work has proposed to generate data for image classifier training given limited real data access. However, these methods struggle to generate in-distribution images or depict fine-grained features, thereby hindering the generalization of classification models trained on synthetic datasets. We propose DataDream, a framework for synthesizing classification datasets that more faithfully represents the real data distribution when guided by few-shot examples of the target classes. DataDream fine-tunes LoRA weights for the image generation model on the few real images before generating the training data using the adapted model. We then fine-tune LoRA weights for CLIP using the synthetic data to improve downstream image classification over previous approaches on a large variety of datasets. We demonstrate the efficacy of DataDream through extensive experiments, surpassing state-of-the-art classification accuracy with few-shot data across 9 out of 10 datasets. Additionally, we provide insights into the impact of various factors, such as the number of real-shot and generated images as well as the fine-tuning compute on model performance.

### Dataset downloading

TODO

### How to use models

There are three phases: 

1) DataDream for adapting the diffusion model with few-shot real images
2) Generate a bunch of images with DataDream
3) Train classifier with generated synthetic data

The way to run each phase is described in each folder: `DataDream`, `generate`, and `classify`
